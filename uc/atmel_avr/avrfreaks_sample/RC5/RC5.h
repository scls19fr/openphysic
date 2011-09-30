#define RC5IN 0

struct RC5 {
	char system;
	char command;
};

int GetRC5(struct RC5 *);
