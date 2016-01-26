#!/bin/bash

# Bake everything we will need.
bin/cake bake all comments -f
bin/cake bake all posts -f
bin/cake bake all users -f
