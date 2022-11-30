create table customer (
  id serial not null primary key,
  name varchar not null,
  surname varchar not null,
  created_at timestamp not null default CURRENT_TIMESTAMP
);

create type order_status as enum ('WAITING_FOR_PAYMENT', 'PAID', 'CANCELED');

create table "order" (
  id serial not null,
  amount decimal(12,2) not null,
  status order_status default 'WAITING_FOR_PAYMENT',
  created_at timestamp not null default CURRENT_TIMESTAMP,
  customer_id integer not null REFERENCES customer (id) on delete cascade,
  primary key (id)
);