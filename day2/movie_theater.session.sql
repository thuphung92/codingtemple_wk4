DROP TABLE IF EXISTS
    customer,
    transaction,
    ticket,
    concession,
    movie;

CREATE TABLE customer (
    customer_id     SERIAL          PRIMARY KEY,
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    phone    VARCHAR(15),
    email    VARCHAR(150)
);

CREATE TABLE movie (
    movie_id                SERIAL      PRIMARY KEY,
    movie_name             VARCHAR(150)    NOT NULL,
    duration     INT,
    genre                   VARCHAR(150),
    description            TEXT
);

CREATE TABLE concession (
    concession_item_id  SERIAL          PRIMARY KEY,
    item_name           VARCHAR(150)    NOT NULL,
    price               NUMERIC(5,2)    NOT NULL
);

CREATE TABLE ticket (
    ticket_id   SERIAL          PRIMARY KEY,
    movie_id    SERIAL          NOT NULL,
    show_date   DATE,
    show_time   TIME,
    price       NUMERIC(4,2)    NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

CREATE TABLE transaction (
    transaction_id      SERIAL      PRIMARY KEY,
    customer_id         SERIAL      NOT NULL,
    transaction_date    TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc', now()),
    ticket_id           SERIAL,
    concession_item_id  SERIAL,
    amount             NUMERIC(8,2)     NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (concession_item_id) REFERENCES concession(concession_item_id) ON DELETE CASCADE
);

INSERT INTO customer (customer_id, first_name, last_name, phone, email)   VALUES
    (1, 'Charles', 'Jackson', '714-597-1567', 'cjackson@gmail.com'),
    (2, 'Ariel',    'Johnson', '659-487-2689',  'ajohnson@gmail.com'),
    (3, 'Leah', 'Kyle', '949-745-5413', 'leah@gmail.com'),
    (4, 'Mathew',   'Adrew', '657-400-5975', 'adrew@gmail.com'),
    (5, 'Terry',    'Hwang',    '714-659-1689', 'hwang@gmail.com');

INSERT INTO movie(movie_id, movie_name, duration, genre, description)  VALUES
    (1, 'Black Widow',  133,    'action',   'In Marvel Studios’ action-packed spy thriller “Black Widow,” Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.'),
    (2, 'The Boss Baby: Famiy Buisiness',    107,    'animation',    'The Templeton brothers have become adults and drifted away from each other, but a new boss baby with a cutting-edge approach is about to bring them together again - and inspire a new family business.'),
    (3, 'Roadrunner: A Film About Anthony Bourdain',    119,    'documentary',  'A Film About Anthony Bourdain is an intimate, behind-the-scenes look at how an anonymous chef became a world-renowned cultural icon. From Academy Award®-winning filmmaker Morgan Neville (20 Feet From Stardom, Won’t You Be My Neighbor?), this unflinching look at Bourdain reverberates with his presence, in his own voice and in the way he indelibly impacted the world around him.'),
    (4, 'Escape Room: Tournament of Champions', 88, 'horror', 'Escape Room: Tournament of Champions is the sequel to the box office hit psychological thriller that terrified audiences around the world. In this installment, six people unwittingly find themselves locked in another series of escape rooms, slowly uncovering what they have in common to survive…and discovering they’ve all played the game before.');

INSERT INTO concession(concession_item_id, item_name, price)   VALUES
    (1, 'popcorn (small)',  6.00),
    (2, 'popcorn (medium)', 7.00),
    (3, 'popcorn (large)',  8.00),
    (4, 'caramel popcorn',  6.50),
    (5, 'small fountain drink', 5.69),
    (6, 'medium fountain drink', 6.19),
    (7, 'large foutain drink', 6.79),
    (8, 'medium candy', 3.99),
    (9, 'large candy', 4.89),
    (10, 'movie snack pack', 6.29),
    (11, 'ice cream', 3.79);

INSERT INTO ticket(ticket_id, movie_id, show_date, show_time, price)    VALUES
    (1, 2, '2021-07-20', '10:00', 10.69),
    (2, 3, '2021-07-30', '15:30', 13.69),
    (3, 1, '2021-07-21', '19:00', 12.69),
    (4, 4, '2021-07-22', '16:15', 13.69),
    (5, 3, '2021-07-31', '18:10', 12.69);

INSERT INTO transaction(transaction_id, customer_id, ticket_id, concession_item_id, amount)   VALUES
    (1,1,1,1,18),
    (2, 1, 2, 5, 19),
    (3, 3, 3, 10, 14.86),
    (4,2,4,9,13.77),
    (5,5,5,11,14.86);
     