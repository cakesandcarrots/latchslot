create table request_keys (customer_id text not null, operation text not null, key text not null check(length(key) BETWEEN 1 and 255 ), fingerprint bytea not null check ( length(fingerprint ) = 32 ), reservation_id uuid not null references reservation_audits(id) ,primary key(customer_id, operation, key)
    
);