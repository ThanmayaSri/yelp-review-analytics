create or replace function analyze_sentiment(text string)
returns string
language python
runtime_version = '3.9'
packages = ('textblob')
handler = 'sentiment_analyzer'
as $$
from textblob import TextBlob
def sentiment_analyzer(text):
    analysis = TextBlob(text)
   
    if analysis.sentiment.polarity > 0:
       return 'Positive'
    elif analysis.sentiment.polarity == 0:
       return 'Neutral'
    else:
       return 'Negative'
$$;    