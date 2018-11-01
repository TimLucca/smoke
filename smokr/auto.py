import docker
import json

client = docker.from_env()

correct_data = json.load(open('./test_files/src.json'))
fail_data = json.load(open('./test_files/src_fail.json'))
python_data = json.load(open('./test_files/python.json'))
c_data = json.load(open('./test_files/cpp.json'))

correct_output = client.containers.run('mine2295/rubby_runner:m',
                               environment={
                                   'SRC_JSON':json.dumps(correct_data)})
fail_output = client.containers.run('mine2295/rubby_runner:m',
                               environment={
                                   'SRC_JSON':json.dumps(fail_data)})
python_output = client.containers.run('mine2295/rubby_runner:m',
                               environment={
                                   'SRC_JSON':json.dumps(python_data)})
c_output = client.containers.run('mine2295/rubby_runner:m',
                               environment={
                                   'SRC_JSON':json.dumps(c_data)})

print("\n\nSingle test (t):\n" + correct_output.decode() + "\n\n")
print("Multiple Tests (f, f, t):\n" + fail_output.decode() + "\n\n")
print("Python data:\n" + python_output.decode() + "\n\n")
print("C data:\n" + c_output.decode() + "\n\n")
