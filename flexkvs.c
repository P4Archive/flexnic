#include <pif_plugin.h>

int hash(int s, int t, int u, int v, int w, int x, int y, int z){
    return (s+t+u+v+w+x+y+z) & 0x3;
}

int pif_plugin_hash_fn(EXTRACTED_HEADERS_T *headers, MATCH_DATA_T *data)
{
    int hash_val;

    PIF_PLUGIN_req_T *req = pif_plugin_hdr_get_req(headers);
    
    //hash_val = hash(key->p1, key->p2, key->p3, key->p4, key->p5, key->p6, key->p7, key->p8);
    hash_val = hash(req->k1, req->k2, req->k3, req->k4, req->k5, req->k6, req->k7, req->k8);

    pif_plugin_meta_set__key_data__core(headers, hash_val);

    return PIF_PLUGIN_RETURN_FORWARD;
}