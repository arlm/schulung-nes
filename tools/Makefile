calebe:
	python makechr/bin/makechr -e ../tilesets/error.png  ../tilesets/Calebe.gif  -z\
		--palette-view ../tilesets/calebe.palette.png \
		--colorization-view ../tilesets/calebe.colorization.png \
		--reuse-view ../tilesets/calebe.reuse.png \
		--nametable-view ../tilesets/calebe.nametable.png \
		--chr-view ../tilesets/calebe.chr.png \
		--grid-view ../tilesets/calebe.grid.png \
		-o ../tilesets/calebe.%s.dat
	cp ../tilesets/calebe.chr.dat ../tilesets/calebe.sprites.chr
	cp ../tilesets/calebe.nametable.dat ../tilesets/calebe.bg_title.nam
	cat ../tilesets/calebe.attribute.dat >> ../tilesets/calebe.bg_title.nam
	head -c 16 ../tilesets/calebe.palette.dat > ../tilesets/calebe.bg_title.pal

rebeca:
	python makechr/bin/makechr -e ../tilesets/error.png  ../tilesets/Rebeca.gif  -z\
		--palette-view ../tilesets/rebeca.palette.png \
		--colorization-view ../tilesets/rebeca.colorization.png \
		--reuse-view ../tilesets/rebeca.reuse.png \
		--nametable-view ../tilesets/rebeca.nametable.png \
		--chr-view ../tilesets/rebeca.chr.png \
		--grid-view ../tilesets/rebeca.grid.png \
		-o ../tilesets/rebeca.%s.dat
	cp ../tilesets/rebeca.chr.dat ../tilesets/rebeca.sprites.chr
	cp ../tilesets/rebeca.nametable.dat ../tilesets/rebeca.bg_title.nam
	cat ../tilesets/rebeca.attribute.dat >> ../tilesets/rebeca.bg_title.nam
	head -c 16 ../tilesets/rebeca.palette.dat > ../tilesets/rebeca.bg_title.pal

nesst:
	wine nesst/NESst.exe

tools:
	cd makechr && python setup.py build
	cd makechr && python setup.py install

