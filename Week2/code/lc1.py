"""This python script shows comprehensions and conventional loops usages when creating lists from a tuple"""

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

latin_name = [row[0] for row in birds]
common_name = [row[1] for row in birds]
mean_body_masses = [row[2] for row in birds]

print(latin_name)
print()
print(common_name)
print()
print(mean_body_masses)
print()

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 
latin_name = []
for row in birds:
    latin_name.append(row[0])

common_name = []
for row in birds:
    common_name.append(row[1])

mean_body_masses = []
for row in birds:
    mean_body_masses.append(row[2])

print(latin_name)
print()
print(common_name)
print()
print(mean_body_masses)
print()