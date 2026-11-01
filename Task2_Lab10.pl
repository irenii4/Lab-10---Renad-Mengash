

% Task 2: Login System

% Dataset
user(ali, 1234).
user(sara, 5678).
user(ahmed, abcd).

% Check username and password
check_login(Username, Password) :-
    user(Username, Password).

% Start login with 3 attempts
login :-
    login_attempt(3).

% Login attempts
login_attempt(Attempts) :-
    Attempts > 0,

    nl,
    write('Enter Username: '),
    read(Username),

    nl,
    write('Enter Password: '),
    read(Password),
    nl,

    ( check_login(Username, Password)
    ->
        write('Login Successful'),
        nl
    ;
        write('Login Unsuccessful'),
        nl,

        Remaining is Attempts - 1,

        ( Remaining > 0
        ->
            write('Attempts remaining: '),
            write(Remaining),
            nl,
            login_attempt(Remaining)
        ;
            write('Sorry, you exceeded the maximum number of attempts, try again later.'),
            nl
        )
    ).
