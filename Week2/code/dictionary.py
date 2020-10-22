"""This python script populates a dictionary 'taxa_dic' derived from a list 'taxa', mapping order names to sets of taxa"""

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

# Method 1
taxa_dic = {}
order = set([row[1] for row in taxa])
for i in range(10):
        for j in order:
                if taxa[i][1] == j:
                        taxa_dic.setdefault(j, set([])).add(taxa[i][0])

print(taxa_dic)

# Method 2
# from collections import defaultdict
# taxa_dict = defaultdict(list)
# for i in range(10):
#         taxa_dict[taxa[i][1]].append(taxa[i][0])

# taxa_dic = {}
# order = set([row[1] for row in taxa])
# for i in order:
#         taxa_dic[i] = set(taxa_dict[i])
# taxa_dic