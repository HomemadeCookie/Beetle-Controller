import requests
import serial
import time
import json

arduino_port = 'COM4'
baud_rate = 9600
ser = serial.Serial(arduino_port, baud_rate)
time.sleep(2)

def get_json_data(url):
    try:
        response = requests.get(url)
        response.raise_for_status()
        print("Raw response: ", response.text)
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

def main():
    url = 'http://localhost:3000/command'
    json_data = get_json_data(url)

    if json_data:
        data_string = json.dumps(json_data)
        ser.write(data_string.encode('utf-8'))
        print(f"Sent data to Arduino: {data_string}")

        ser.close()

if __name__ == "__main__":
    main()
