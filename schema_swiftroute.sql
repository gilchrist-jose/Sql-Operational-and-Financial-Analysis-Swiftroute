CREATE TABLE carriers (
	carrier_id INT NOT NULL PRIMARY KEY,
	carrier_name VARCHAR(50) NOT NULL,
	carrier_type VARCHAR(10) NOT NULL CHECK(carrier_type IN ('Air','Road','Sea'))
);

CREATE TABLE routes (
	route_id INT NOT NULL PRIMARY KEY,
	origin_hub VARCHAR(50) NOT NULL,
	destination_hub VARCHAR(50) NOT NULL,
	corridor VARCHAR(50) NOT NULL CHECK(corridor IN ('GCC','South Asia','East Africa')),
	distance_km INT NOT NULL,
	standard_transit_days INT NOT NULL
);

CREATE TABLE shipments (
	shipments_id INT NOT NULL PRIMARY KEY,
	carrier_id INT REFERENCES carriers(carrier_id),
	route_id INT REFERENCES routes(route_id),
	origin VARCHAR(50),
	destination VARCHAR(50),
	ship_date DATE,
	expected_delivery DATE,
	actual_delivery DATE,
	status VARCHAR(10),
	weight_kg NUMERIC(10,2),
	freight_charge_aed NUMERIC(10,2)
);

CREATE TABLE charges (
	shipment_id INT NOT NULL,
	charge_type VARCHAR(50) NOT NULL,
	amount_aed NUMERIC(10,2) NOT NULL,
	PRIMARY KEY (shipment_id,charge_type)
);