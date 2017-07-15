#define ETHERTYPE_IPV4 0x0800
#define IP_PROTOCOLS_UDP 17

header eth_t eth;
header ipv4_t ipv4;
header udp_t udp;
header req_t req;
//header key_t key;

metadata key_metadata_t key_data;

parser start {
	return parse_ethernet;
}

parser parse_ethernet {
    extract(eth);
    return select(latest.etype) {
        ETHERTYPE_IPV4 : parse_ipv4;
        default: ingress;
    }
}

parser parse_ipv4 {
    extract(ipv4);
    return select(latest.protocol) {
        IP_PROTOCOLS_UDP : parse_udp;
        default: ingress;
    }
}

parser parse_udp {
    extract(udp);

	return select(standard_metadata.ingress_port) {
		0: parse_req;
		default: ingress;
	}
}

parser parse_req {
	extract(req);
	//extract(key);

	return ingress;
}