# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"N053900","system":"readv2"},{"code":"Nyu2D00","system":"readv2"},{"code":"N050500","system":"readv2"},{"code":"Nyu2.00","system":"readv2"},{"code":"N051C00","system":"readv2"},{"code":"N050400","system":"readv2"},{"code":"N050600","system":"readv2"},{"code":"Nyu2900","system":"readv2"},{"code":"M16","system":"readv2"},{"code":"M18","system":"readv2"},{"code":"M17","system":"readv2"},{"code":"M19","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('osteoarthritis-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["osteoarthritis-excl-spine-osteoarthrosis---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["osteoarthritis-excl-spine-osteoarthrosis---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["osteoarthritis-excl-spine-osteoarthrosis---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
