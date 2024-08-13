from datetime import datetime
from flask import jsonify, redirect
from google.cloud import storage
from google.oauth2.service_account import Credentials

import functions_framework
import gspread
import json

bucket_name = '<#bucket name#>'
blob_name = '<#bucket blob name#>'

SHEET_ID = "<#spreadsheet id#>"
SCOPES = ['https://www.googleapis.com/auth/spreadsheets', 'https://www.googleapis.com/auth/drive']

client = storage.Client()
bucket = client.get_bucket(bucket_name)
blob = bucket.blob(blob_name)
json_data = blob.download_as_text()
service_account_info = json.loads(json_data)

credentials = Credentials.from_service_account_info(service_account_info, scopes=SCOPES)
client = gspread.authorize(credentials)
sheet = client.open_by_key(SHEET_ID).sheet1

@functions_framework.http
def capture_email(request):
    """HTTP Cloud Function to capture user emails and store them in Google Sheets."""
    email = None

    if request.is_json:
        request_json = request.get_json(silent=True)
        if request_json and 'email' in request_json:
            email = request_json['email']
    elif request.form and 'email' in request.form:
        email = request.form['email']
    elif request.args and 'email' in request.args:
        email = request.args['email']

    if email:
        sheet.append_row([datetime.now().isoformat(), email])
        if request.is_json:
            return jsonify({"message": "Email captured successfully", "metadata": metadata}), 200
        else:
            return redirect("https://hogmobile.com/thank_you")
    else:
        if request.is_json:
            return jsonify({"message": "Invalid request, email not found"}), 400
        else:
            return redirect("https://hogmobile.com#missing_email")
