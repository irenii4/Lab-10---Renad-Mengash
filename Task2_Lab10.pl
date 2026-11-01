

% Task 2: Login System

% Dataset
user(ali, '1234').
user(sara, '5678').
user(ahmed, 'abcd').

% Check username and password
check_login(Username, Password) :-
    user(Username, Password).

% Start login
login :-
    login_attempt(3).

% Login attempts
login_attempt(Attempts) :-
    Attempts > 0,

    write('Enter Username: '),
    read(Username),

    write('Enter Password: '),
    read(Password),

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
