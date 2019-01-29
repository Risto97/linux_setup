import subprocess
import sys
import json

from six import iteritems
from collections import defaultdict

def nested_lookup(key, value, document, wild=False, with_keys=False, only_node_with_match=False):
    """Lookup a key in a nested document, return a list of values"""
    if with_keys:
        d = defaultdict(list)
        for k, v in _nested_lookup(key, value, document, wild=wild, with_keys=with_keys, only_node_with_match=only_node_with_match):
            d[k].append(v)
        return d
    return list(_nested_lookup(key, value, document, wild=wild, with_keys=with_keys, only_node_with_match=only_node_with_match))

def _nested_lookup(key, value, document, wild=False, with_keys=False, only_node_with_match=False):
    """Lookup a key in a nested document, yield a value"""
    scratchpad_nodes=[]
    if isinstance(document, list):
        for d in document:
            for result in _nested_lookup(key, value, d, wild=wild, with_keys=with_keys, only_node_with_match=only_node_with_match):
                yield result

    if isinstance(document, dict):
        for k, v in iteritems(document):
            if key == k or (wild and key.lower() in k.lower()):
                if v == value and only_node_with_match is True:
                    yield document

                if only_node_with_match is False:
                    if with_keys:
                        yield k, v
                    else:
                        yield v
            elif isinstance(v, dict):
                for result in _nested_lookup(key, value, v, wild=wild, with_keys=with_keys, only_node_with_match=only_node_with_match):
                    yield result
            elif isinstance(v, list):
                for d in v:
                    for result in _nested_lookup(key, value, d, wild=wild, with_keys=with_keys, only_node_with_match=only_node_with_match):
                        yield result

command = "i3-msg -t get_tree"

bash_return = subprocess.getoutput(command)

json_tree = json.loads(bash_return)

nodes_with_scratchpad_window = nested_lookup('scratchpad_state', 'fresh', json_tree, only_node_with_match=True)
names_of_scratchpad_windows = nested_lookup('class', None, nodes_with_scratchpad_window, only_node_with_match=False)

for i in names_of_scratchpad_windows:
    print(i, "|", end=" ")
