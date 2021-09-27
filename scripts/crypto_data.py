from cryptofeed import FeedHandler
from cryptofeed.defines import TRADES
from cryptofeed.exchanges import Coinbase, Bitstamp, Binance
from datetime import datetime

async def trade(data, *args, **kwargs):
    time, amount, price, symbol, timestamp = int(data.timestamp * 1000000), data.amount, data.price, data.symbol, datetime.fromtimestamp(data.timestamp)
    print("{}\t{}\t{}\t{}\t{}\t".format(time, amount, symbol, price, timestamp))

def main():
    print("Time \t Amount \t Symbol \t Price \t Side \t Timestamp ")
    feed = FeedHandler()
    # feed.add_feed(Coinbase(symbols=['BTC-USD'], channels=[TRADES], callbacks={TRADES: trade}))
    # feed.add_feed(Bitstamp(symbols=['BTC-USD'], channels=[TRADES], callbacks={TRADES: trade}))
    feed.add_feed(Binance(symbols=['BTC-USDT'], channels=[TRADES], callbacks={TRADES: trade}))

    feed.run()

if __name__ == "__main__":
    main()