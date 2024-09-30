class JsonExtender(object):
    # Add obj to existing json
    def extend_json_obj(self, json_obj, key, value):
        json_obj[key]=value
        return json_obj