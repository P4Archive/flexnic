#include "headers.p4"
#include "parsers.p4"

primitive_action hash_fn();

action fwd_act(prt) {
	modify_field(standard_metadata.egress_spec, prt);
}

action key_act() {
	hash_fn();
}

table io_tbl {
	reads {
		standard_metadata.ingress_port : exact;
	}
	actions {
		fwd_act;
		key_act;
	}
}

table key_tbl {
	reads {
		key_data.core : exact;
	}
	actions {
		fwd_act;
	}
}

control ingress {
	apply(io_tbl) {
		key_act {
			apply(key_tbl);
		}
	}	
}
