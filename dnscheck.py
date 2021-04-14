import dns.resolver
import colorama
from colorama import Fore, Style

print("[*] Initiating...")

my_resolver = dns.resolver.Resolver()


def check(ip):
	try:
		my_resolver.nameservers = [ip]
		answer = my_resolver.resolve('crazyrat.pl')
	except:
		print("[-] [",ip,"]:",Fore.GREEN,"OK")
	else:
		print("[!] [",ip,"]:",Fore.RED,"public DNS resolver")
		#print("\t",answer.rrset[1])
		#print(answer.response)
	return

# list of IPs to check
IPs = ["8.8.8.8", "127.0.0.1"]

for IP in IPs:
	check(IP)

