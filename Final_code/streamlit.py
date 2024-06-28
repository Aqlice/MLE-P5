import streamlit as st
import json
import requests

st.title("Prédiction de tags StackOverflow")

x = st.text_input("Please enter your text here, and we'll have tags related to it in no time", "")

if st.button("Search tags"):
    data = {'text': x}
    response = requests.post('http://127.0.0.1:8000/predict/', json=data)
    prediction = response.json()['prediction'][0]
    st.write(f"Your suggested Tags are `{prediction}`")