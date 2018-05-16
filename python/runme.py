#!/usr/bin/env python

import csv

with open('sample.csv', 'rb') as csvfile:
    r = csv.reader(csvfile, delimiter=';', quotechar=' ')
    for row in r:
        print ', '.join(row)

with open('sample.csv', 'rb') as csvfile:
	dr = csv.DictReader(csvfile, delimiter=';', quotechar=' ')
	for row in dr:
		print(row['id'], row['name'], row['arr'])
		arr = row['arr']
		s = arr.split(' ')

import pandas as pd

df = pd.read_csv('/vagrant/sample.csv')
df
df = pd.read_csv('/vagrant/sample.csv',delimiter=';',quotechar=' ')
df

a = df
a
b = df[df.arr.notnull()]
b
c = b['arr']
c
d = c.apply(lambda x : pd.Series(x.split(' '))).stack()
d
e = d.reset_index()
e
f = a.reset_index()
f
g = pd.merge(e,f,left_on = 'level_0',right_on = 'index' )
g
h = g[['id','name',0]].rename(index=str, columns={0: "chr"})
h
