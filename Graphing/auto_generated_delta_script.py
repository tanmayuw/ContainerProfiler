import argparse
import os
import shutil
import sys
import json
import copy
import configparser
from collections import namedtuple

parser = argparse.ArgumentParser(description='process path and file /or string of metrics.')
parser.add_argument('file_path', action='store', help='stores the filepath to the folder holding all the JSON files')
parser.add_argument('delta_interval_time', action='store', help='stores time interval of when to take delta sample')
args= parser.parse_args()
file_path = args.file_path
if os.path.exists(file_path + '/delta_json'):
	shutil.rmtree(file_path + '/delta_json')
if not os.path.exists(file_path + '/delta_json'):
	os.makedirs(file_path + '/delta_json')

json_array = []
delta_name_array = []
dirs=  sorted([i for i in os.listdir( file_path ) if i.endswith(".json")])
for file_name in dirs:
	with open(file_path + '/' + file_name) as json_file: 
		print ('JSON FILES TANMAY:')
		print(json_file)
		try:
			new_json_object = json.load(json_file)
			json_array.append(new_json_object)
			new_name= ((file_path+'/delta_json/'+file_name).split('.json')[0] + '_delta.json')
			delta_name_array.append(new_name)

		except Exception as e:
			print ("{} invalid file".format(json_file))
			pass
def file_subtraction(the_json_one, the_json_two):
	json_three = copy.deepcopy(the_json_two)
	if ('cCpuTime' in the_json_one.keys()):
		json_three['cCpuTime']=the_json_two['cCpuTime']-the_json_one['cCpuTime']
	if ('cCpuTimeKernelMode' in the_json_one.keys()):
		json_three['cCpuTimeKernelMode']=the_json_two['cCpuTimeKernelMode']-the_json_one['cCpuTimeKernelMode']
	if ('cCpuTimeUserMode' in the_json_one.keys()):
		json_three['cCpuTimeUserMode']=the_json_two['cCpuTimeUserMode']-the_json_one['cCpuTimeUserMode']
	if ('cDiskReadBytes' in the_json_one.keys()):
		json_three['cDiskReadBytes']=the_json_two['cDiskReadBytes']-the_json_one['cDiskReadBytes']
	if ('cDiskSectorIO' in the_json_one.keys()):
		json_three['cDiskSectorIO']=the_json_two['cDiskSectorIO']-the_json_one['cDiskSectorIO']
	if ('cDiskWriteBytes' in the_json_one.keys()):
		json_three['cDiskWriteBytes']=the_json_two['cDiskWriteBytes']-the_json_one['cDiskWriteBytes']
	if ('cNetworkBytesRecvd' in the_json_one.keys()):
		json_three['cNetworkBytesRecvd']=the_json_two['cNetworkBytesRecvd']-the_json_one['cNetworkBytesRecvd']
	if ('cNetworkBytesSent' in the_json_one.keys()):
		json_three['cNetworkBytesSent']=the_json_two['cNetworkBytesSent']-the_json_one['cNetworkBytesSent']
	if ('vCpuContextSwitches' in the_json_one.keys()):
		json_three['vCpuContextSwitches']=the_json_two['vCpuContextSwitches']-the_json_one['vCpuContextSwitches']
	if ('vCpuIdleTime' in the_json_one.keys()):
		json_three['vCpuIdleTime']=the_json_two['vCpuIdleTime']-the_json_one['vCpuIdleTime']
	if ('vCpuNice' in the_json_one.keys()):
		json_three['vCpuNice']=the_json_two['vCpuNice']-the_json_one['vCpuNice']
	if ('vCpuSteal' in the_json_one.keys()):
		json_three['vCpuSteal']=the_json_two['vCpuSteal']-the_json_one['vCpuSteal']
	if ('vCpuTime' in the_json_one.keys()):
		json_three['vCpuTime']=the_json_two['vCpuTime']-the_json_one['vCpuTime']
	if ('vCpuTimeIOWait' in the_json_one.keys()):
		json_three['vCpuTimeIOWait']=the_json_two['vCpuTimeIOWait']-the_json_one['vCpuTimeIOWait']
	if ('vCpuTimeKernelMode' in the_json_one.keys()):
		json_three['vCpuTimeKernelMode']=the_json_two['vCpuTimeKernelMode']-the_json_one['vCpuTimeKernelMode']
	if ('vCpuTimeSoftIntSrvc' in the_json_one.keys()):
		json_three['vCpuTimeSoftIntSrvc']=the_json_two['vCpuTimeSoftIntSrvc']-the_json_one['vCpuTimeSoftIntSrvc']
	if ('vCpuTimeUserMode' in the_json_one.keys()):
		json_three['vCpuTimeUserMode']=the_json_two['vCpuTimeUserMode']-the_json_one['vCpuTimeUserMode']
	if ('vDiskMergedReads' in the_json_one.keys()):
		json_three['vDiskMergedReads']=the_json_two['vDiskMergedReads']-the_json_one['vDiskMergedReads']
	if ('vDiskMergedWrites' in the_json_one.keys()):
		json_three['vDiskMergedWrites']=the_json_two['vDiskMergedWrites']-the_json_one['vDiskMergedWrites']
	if ('vDiskReadTime' in the_json_one.keys()):
		json_three['vDiskReadTime']=the_json_two['vDiskReadTime']-the_json_one['vDiskReadTime']
	if ('vDiskSectorWrites' in the_json_one.keys()):
		json_three['vDiskSectorWrites']=the_json_two['vDiskSectorWrites']-the_json_one['vDiskSectorWrites']
	if ('vDiskSuccessfulReads' in the_json_one.keys()):
		json_three['vDiskSuccessfulReads']=the_json_two['vDiskSuccessfulReads']-the_json_one['vDiskSuccessfulReads']
	if ('vDiskSuccessfulWrites' in the_json_one.keys()):
		json_three['vDiskSuccessfulWrites']=the_json_two['vDiskSuccessfulWrites']-the_json_one['vDiskSuccessfulWrites']
	if ('vDiskWriteTime' in the_json_one.keys()):
		json_three['vDiskWriteTime']=the_json_two['vDiskWriteTime']-the_json_one['vDiskWriteTime']
	if ('vNetworkBytesRecvd' in the_json_one.keys()):
		json_three['vNetworkBytesRecvd']=the_json_two['vNetworkBytesRecvd']-the_json_one['vNetworkBytesRecvd']
	if ('vNetworkBytesSent' in the_json_one.keys()):
		json_three['vNetworkBytesSent']=the_json_two['vNetworkBytesSent']-the_json_one['vNetworkBytesSent']
	if ('cProcessorStats' in the_json_one.keys()):
		for (each_key) in the_json_two['cProcessorStats']:
			if ('cCpu' in each_key and 'TIME' in each_key):
				json_three['cProcessorStats'][each_key] = the_json_two['cProcessorStats'][each_key] - the_json_one['cProcessorStats'][each_key]
	return json_three

delta_json_array=[]
count = 0
first = json_array[0]
for i in range(1, len(json_array)):
	count +=   (json_array[i]["currentTime"] - json_array[i-1]["currentTime"])
	if count >= int(args.delta_interval_time):
		delta_json_array.append(file_subtraction(first, json_array[i]))
		count = 0
		first = json_array[i]

for i in range(len(delta_json_array)):
	with open(delta_name_array[i], 'w') as fp:
		json.dump(delta_json_array[i], fp, sort_keys=True, indent=2)
