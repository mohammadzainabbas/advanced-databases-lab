from cryptofeed import FeedHandler
from cryptofeed.defines import TRADES
from cryptofeed.exchanges import Coinbase, Bitstamp, Binance
from datetime import datetime

# Total records to store for now
# total_records = int(1e6)
total_records = int(10)

# List to store trades info
trades = []

async def trade(data, *args, **kwargs):
    time, amount, price, symbol, timestamp = int(data.timestamp * 1000000), data.amount, data.price, data.symbol, datetime.fromtimestamp(data.timestamp)

    temp = {}

    temp["time"] = time
    temp["amount"] = amount
    temp["symbol"] = symbol
    temp["price"] = price
    temp["timestamp"] = timestamp

    trades.append(temp)

    if len(trades) == total_records:
        import pandas as pd
        import sys
        import asyncio

        df = pd.DataFrame.from_dict(trades)
        df.to_csv(r'trades.csv', index=False, header=True)

        loop = asyncio.get_event_loop()
        loop.stop()

        # sys.exit(0)
    # print("{}: {}\t{}\t{}\t{}\t{}\t".format(len(trades), time, amount, symbol, price, timestamp))

def main():
    # print("Time \t Amount \t Symbol \t Price \t Side \t Timestamp ")
    feed = FeedHandler()
    # feed.add_feed(Coinbase(symbols=['BTC-USD'], channels=[TRADES], callbacks={TRADES: trade}))
    # feed.add_feed(Bitstamp(symbols=['BTC-USD'], channels=[TRADES], callbacks={TRADES: trade}))
    feed.add_feed(Binance(symbols=['BTC-USDT'], channels=[TRADES], callbacks={TRADES: trade}))

    feed.run()

if __name__ == "__main__":
    main()