% Initial shopping basket
start :-
    shopping_list([coffee, milk, chocolate, apple, juice]).

% Main program
shopping_list(List) :-
    nl,
    write('*** SHOPPING LIST ***'), nl,
    write('d. Display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. Exit.'), nl,
    write('ENTER YOUR CHOICE: '),

    read(Choice),
    process_choice(Choice, List).

% Display all items
process_choice(d, List) :-
    display_items(List),
    shopping_list(List).

% Add a new item
process_choice(a, List) :-
    write('Enter the item you want to add: '),
    read(Item),
    append(List, [Item], NewList),
    write('The item has been added.'), nl,
    shopping_list(NewList).

% Exit the program
process_choice(e, _) :-
    write('Goodbye!'), nl.

% Handle invalid choices
process_choice(_, List) :-
    write('Invalid choice. Try again.'), nl,
    shopping_list(List).

% Recursive predicate to display items
display_items([]).

display_items([Head|Tail]) :-
    write(Head), nl,
    display_items(Tail).
