# -*- coding: utf-8 -*-
from flask import request, jsonify
from flask_restful import Resource
import json
from Crawler import gs

class MessageResponse(Resource):
    def get(self):
        args = request.args
        received_message = args['kw']
        print(received_message)
        k = dict(json.loads(received_message))
        gs(k.get("keyword"))

        return jsonify({'result': received_message})

