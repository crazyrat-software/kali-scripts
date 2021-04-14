import dns.resolver
import colorama
from colorama import Fore, Style
import csv

print("[*] Initiating...")

my_resolver = dns.resolver.Resolver()


def check(ip):
	try:
		my_resolver.nameservers = [ip]
		answer = my_resolver.resolve('google.com')
	except:
		print("[-] [",ip,"]:",Fore.GREEN,"OK",Style.RESET_ALL)
	else:
		print("[!] [",ip,"]:",Fore.RED,"public DNS resolver",Style.RESET_ALL)
		#print("\t",answer.rrset[1])
		#print(answer.response)
	return

# load IPs from file
try:
    IPs = []
    with open('dnscheck.txt', newline='') as file:
        data = csv.reader(file)
        for l in data:
            IPs.append(l[0])
except:
# or prepopulate list in code
    IPs = ["8.8.8.8", "127.0.0.1"]

for IP in IPs:
    check(IP)

