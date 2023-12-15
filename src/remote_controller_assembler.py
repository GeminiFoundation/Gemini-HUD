# Modified DeadRanks Assembler
# Import Required Libraries
import os, argparse, shutil
from pathlib import Path

# Get Current Working Directory
cwd = os.path.dirname(os.path.realpath(__file__))

# Set variables for which folder to assemble
src = 'remote-controller'
path = os.path.join(cwd,src)

# Mapping of Folders to .conf files
confMap = {
    'remote-controller':'GHUD_remote_controller.conf'
}

# Setup and pull lua files
luaCode = []
yamlTemplate = ''
if 'lua' in os.listdir(path) and ('confTemplate.yaml' in os.listdir(path) or 'confTemplate.json' in os.listdir(path)):
    luaPath = os.path.join(path,'lua')
    if 'confTemplate.yaml' in os.listdir(path):
        yamlTemplate = open(os.path.join(path,'confTemplate.yaml'),'r').read()
    elif 'confTemplate.json' in os.listdir(path):
        yamlTemplate = open(os.path.join(path,'confTemplate.json'),'r').read()
    for file in os.listdir(os.path.join(path,'lua')):
        if file[-4:] == '.lua':
            luaCode.append(file)

if yamlTemplate:
    with open(os.path.join(cwd,confMap[src]),'w') as f:
        for file in luaCode:
            print('Replacing {0}'.format(file))
            lua = ''
            if 'confTemplate.yaml' in os.listdir(path):
                for line in open(os.path.join(path,'lua',file),'r').readlines():
                    lua += '    '*(len(file.split('.'))+1) + line
            elif 'confTemplate.json' in os.listdir(path):
                for line in open(os.path.join(path,'lua',file),'r').readlines():
                    lua += line.replace('\n','\\n')
            yamlTemplate = yamlTemplate.replace('{{'+file+'}}',lua)
            
        if '{{' in yamlTemplate:
            print('ERROR: Not all variables found')
            i = yamlTemplate.index('{{')
            print(yamlTemplate[i-100:i+100])
        else:
            print('SUCCESS: New config file written')
            f.write(yamlTemplate)
            f.close()