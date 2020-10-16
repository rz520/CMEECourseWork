taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a short python script to populate a dictionary called taxa_dic 
# derived from  taxa so that it maps order names to sets of taxa. 
# E.g. 'Chiroptera' : set(['Myotis lucifugus']) etc. 

from collections import defaultdict
taxa_dict = defaultdict(list)
taxa_set = [row[0] for row in taxa]
order_name = [row[1] for row in taxa]

for i in range(10):
        taxa_dict[order_name[i]].append(taxa_set[i])

taxa_dic = {}
order = set(order_name)
for i in order:
        taxa_dic[i] = set(taxa_dict[i])
taxa_dic
