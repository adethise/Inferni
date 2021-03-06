CC = g++
CFLAGS = 
LDFLAGS = -Wall -MD
LSDL = -lSDL2

COREOBJ = Core/display_manager.o Core/game.o Core/game_state.o Core/global.o Core/intro_state.o Core/menu_state.o Core/play_state.o
UTILOBJ = Util/fps_counter.o Util/image_func.o
OBJECTOBJ = Objects/collision_object.o Objects/creature.o Objects/movable_object.o Objects/wall.o
MAINOBJ = main.o
OBJ = $(COREOBJ) $(MAINOBJ) $(UTILOBJ) $(OBJECTOBJ)
EXEC = InferniGame

MKDIR = mkdir -p
BUILDDEST = build


rebuild: clean game

Core/%.o: Core/%.cpp folders
	$(CC) -c -o build/$@ $< $(CFLAGS) $(LSDL)

Util/%.o: Util/%.cpp folders
	$(CC) -c -o build/$@ $< $(CFLAGS) $(LSDL)

Objects/%.o: Objects/%.cpp folders
	$(CC) -c -o build/$@ $< $(CFLAGS) $(LSDL)

%.o: %.cpp
	$(CC) -c -o build/$@ $< $(CFLAGS) $(LSDL)


game: $(OBJ) folders
	$(CC) $(ARG) $(addprefix build/,$(OBJ)) -o $(EXEC) $(LSDL)

folders:
	$(MKDIR) build
	$(MKDIR) build/Core
	$(MKDIR) build/Util
	$(MKDIR) build/Objects

clean:
	rm -rf $(BUILDDEST) $(EXEC)

.PHONY: rebuild clean folders game
