from urllib import response
from flask import Flask, jsonify, request
import json
from DataProcessor import getOrder

response = ''

app = Flask(__name__)

@app.route('/name', methods = ['GET', 'POST'])

def nameRoute():

    global response

    if(request.method == 'POST'): 
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        name = request_data['name']
        inputString = ''.join(name)
        print(inputString)

        try:
            f = open('input_num.txt', 'w')
            f.write(inputString)
            # perform file operations
        finally:
            f.close()
        response = getOrder()
        print(response)
        return ""
    else:
        return jsonify({'name' : response})


if __name__ == "__main__":
    app.run(debug=True)
