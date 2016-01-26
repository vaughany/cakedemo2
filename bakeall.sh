#!/bin/bash

# Bake everything we will need.
#bin/cake bake all comments -f
#bin/cake bake all posts -f
#bin/cake bake all tags -f
#bin/cake bake all users -f

bin/cake bake controller comments -f
bin/cake bake template comments -f
bin/cake bake controller posts -f
bin/cake bake template posts -f
bin/cake bake controller tags -f
bin/cake bake template tags -f
bin/cake bake controller users -f
bin/cake bake template users -f

bin/cake bake model posts_tags -f
