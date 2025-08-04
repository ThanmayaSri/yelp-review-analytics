# 📊 Yelp Business Reviews Analysis | End‑to‑End ELT Project

This project demonstrates a complete cloud-based data pipeline that ingests and analyzes large-scale Yelp review data using **Python**, **AWS S3**, and **Snowflake**. It covers ingestion, transformation, sentiment analysis, and insight extraction.

---

## 🚀 Project Highlights

- 📂 **5GB+ raw dataset** in deeply nested JSON format
- 🪓 **Split into 20+ files** for scalable ingestion via Python
- ☁️ **Uploaded to AWS S3** and loaded into Snowflake using external stages
- 🧠 **Sentiment analysis** using Python UDF with TextBlob inside Snowflake
- 📈 Performed advanced SQL analytics to uncover business insights

---

## 📁 Repository Structure

yelp-review-analytics/
├── notebooks/
│ └── split_and_upload.ipynb # Python code to split and upload dataset
├── snowflake/
│ ├── create_reviews_table.sql # [AWS credentials redacted]
│ ├── create_business_table.sql # [AWS credentials redacted]
│ ├── sentiment_udf.sql
├── outputs/
│ └── analysis_queries.sql
└── README.md

---

## ⚠️ Data Accessibility

> ❌ **Dataset not included in repo due to size limits and privacy**
>
> Even the split JSON files (~25–30MB each) exceeded GitHub’s 25MB upload limit via web interface.

You can download the full dataset or generate split files using the code provided.

🔗 **Yelp Dataset**: [https://www.yelp.com/dataset](https://www.yelp.com/dataset)

---

## 🔐 AWS Credentials Notice

The following files originally included sensitive AWS credentials and have been redacted:
- `create_reviews_table.sql`
- `create_business_table.sql`

Please configure your own **Snowflake storage integration** or use environment variables for secure access.

---

## 🛠️ Tools & Tech Stack

| Tool          | Purpose                                 |
|---------------|------------------------------------------|
| Python        | Data splitting, S3 upload                |
| AWS S3        | Scalable object storage for raw data     |
| Snowflake     | Cloud data warehouse + SQL & Python UDFs |
| TextBlob      | Sentiment analysis (Python in Snowflake) |
| SQL           | Data transformation and insights         |

---

## 🧠 Key Steps

1. **Split JSON**  
   Preprocess the large Yelp review file into ~20 smaller chunks using Python.

2. **Upload to S3**  
   Store files in AWS S3 buckets (`/reviews/`, `/business/`) as a data lake.

3. **Snowflake External Stage**  
   Create external stages to load data using `VARIANT` and `LATERAL FLATTEN`.

4. **Sentiment Analysis**  
   Use a Python UDF with TextBlob inside Snowflake to classify each review.

5. **SQL Analytics**  
   Use CTEs, window functions, and aggregation to extract insights:
   - Top 3 recent reviews per business
   - Sentiment by city/category
   - Review trends

---

## 📈 Sample Insights

🔍 “**Restaurants in Phoenix** have the highest average sentiment.”  
🏙️ “**Las Vegas nightlife** shows the most mixed reviews.”  
💬 “**Neutral sentiments** dominate reviews with 3-star ratings.”

---

## 🧪 Run It Yourself

1. 📥 **Clone the repo**
2. 📂 **Provide your own Yelp dataset**  
   Download the full dataset from [Yelp Open Dataset](https://www.yelp.com/dataset)  
   or use the included Python script to generate split files.
3. ☁️ **Upload to your S3 bucket**
4. 🧊 **Configure Snowflake storage integration** securely
5. 🧠 **Run the SQL scripts** to create tables, analyze sentiment, and extract insights

