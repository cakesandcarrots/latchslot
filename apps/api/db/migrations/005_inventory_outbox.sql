create table inventory_outbox( id uuid primary key default uuidv4(), sku_id uuid not null references skus(id), version bigint not null check(version>=0),available int not null check(available >=0),attempt_token text , reservation_deadline timestamptz, event_type text not null check (event_type in ('HOLD_CREATED','SNAPSHOT')) , delivery_state text not null default 'PENDING' check(delivery_state in ( 'PENDING', 'DELIVERED')), next_attempt_at timestamptz not null default now() );

create index inventory_outbox_pending_idx on inventory_outbox(next_attempt_at) where delivery_state = 'PENDING';
