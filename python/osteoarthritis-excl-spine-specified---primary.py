# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"N053z00","system":"readv2"},{"code":"N054100","system":"readv2"},{"code":"N053800","system":"readv2"},{"code":"N05z800","system":"readv2"},{"code":"N054400","system":"readv2"},{"code":"N054800","system":"readv2"},{"code":"N053600","system":"readv2"},{"code":"N052000","system":"readv2"},{"code":"N051000","system":"readv2"},{"code":"N050000","system":"readv2"},{"code":"N054z00","system":"readv2"},{"code":"N05z000","system":"readv2"},{"code":"N054600","system":"readv2"},{"code":"N051800","system":"readv2"},{"code":"N053000","system":"readv2"},{"code":"N053.00","system":"readv2"},{"code":"N054700","system":"readv2"},{"code":"N054500","system":"readv2"},{"code":"N053100","system":"readv2"},{"code":"N054000","system":"readv2"},{"code":"N053400","system":"readv2"},{"code":"N052800","system":"readv2"},{"code":"N053700","system":"readv2"},{"code":"N054.00","system":"readv2"},{"code":"N053500","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('osteoarthritis-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["osteoarthritis-excl-spine-specified---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["osteoarthritis-excl-spine-specified---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["osteoarthritis-excl-spine-specified---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
