import requests
import json

metadata_url = 'http://169.254.169.254/latest/meta-data/'


def metadata():
    result = {}
    r = requests.get(url)
    text = r.text
    result['metadata'] = text
    return result


def fun():
    md = metadata()
    fun_json = json.dumps(md, sort_keys=True)
    return fun_json


if __name__ == '__main__':
    print(fun())