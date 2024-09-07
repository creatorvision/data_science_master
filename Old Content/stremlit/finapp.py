import yfinance as yf
import streamlit as st
import pandas as pd
import datetime
from datetime import date

st.write("""
    # Simple Stock App 

    Shows the Stock Closing price and volume 
""")

x = st.text_input("Enter the Ticker:")
sd = st.date_input("Start Date", datetime.date(2010, 1, 1))
ed = date.today()



tickerSymbol = x
tickerData = yf.Ticker(tickerSymbol)
tickerDf = tickerData.history(period ='id', start = sd , end= ed)

st.line_chart(tickerDf.Close)
st.line_chart(tickerDf.Volume)

st.dataframe(tickerDf.style.highlight_max(axis=0))
