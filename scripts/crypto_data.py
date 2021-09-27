from cryptofeed import FeedHandler
from cryptofeed.defines import TRADES
from cryptofeed.exchanges import Binance
from datetime import datetime
from time import time

# Total records to store for now
total_records = int(1e6)

# List to store trades info
trades = []

start_time = time()

# Callback for trade(s) feed
async def trade(data, *args, **kwargs):

    temp = {}
    temp["time"], temp["amount"], temp["symbol"], temp["price"], temp["side"], temp["timestamp"] = int(data.timestamp * 1000000), data.amount, data.symbol, data.price, data.side, datetime.fromtimestamp(data.timestamp)

    trades.append(temp)

    # Save & exit when we reach our desired no. of records
    if len(trades) == total_records:
        import pandas as pd
        import asyncio

        df = pd.DataFrame.from_dict(trades)
        df.to_csv(r'trades.csv', index=False, header=True)

        print("Took {} seconds to collect {} records...".format( time() - start_time, total_records))

        loop = asyncio.get_event_loop()
        loop.stop()

        exit()

def main():
    feed = FeedHandler()
    feed.add_feed(Binance(symbols=['BTC-USDT'], channels=[TRADES], callbacks={TRADES: trade}))
    feed.run()

if __name__ == "__main__":
    main()