header_type eth_t {
	fields {
	  dst : 48;
	  src : 48;
	  etype : 16;
	}
}

header_type ipv4_t {
    fields {
        version : 4;
        ihl : 4;
        diffserv : 8;
        totalLen : 16;
        identification : 16;
        flags : 3;
        fragOffset : 13;
        ttl : 8;
        protocol : 8;
        hdrChecksum : 16;
        srcAddr : 32;
        dstAddr: 32;
    }
}

header_type udp_t {
    fields {
        srcPort : 16;
        dstPort : 16;
        length_ : 16;
        checksum : 16;
    }
}

header_type req_t {
	fields {
		fill : 256;
		k1 : 32;
		k2 : 32;
		k3 : 32;
		k4 : 32;
		k5 : 32;
		k6 : 32;
		k7 : 32;
		k8 : 32;
	}
}
/*
header_type key_t {
	fields {
		p1 : 32;
		p2 : 32;
		p3 : 32;
		p4 : 32;
		p5 : 32;
		p6 : 32;
		p7 : 32;
		p8 : 32;
	}
}*/

header_type key_metadata_t {
	fields {
		core : 32;
	}
}