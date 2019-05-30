void proc1Rt()
{
    List_int v0;
    chan_recv_buf(c1, &v0, sizeof(List_int));
    List_int v1;
    v1 = sort(v0);
    chan_send_buf(c2, &v1, sizeof(List_int));
}
void * proc1()
{
    proc1Rt();
    return NULL;
}
List_int proc0(List_int v0)
{
    c1 = chan_init(1);
    c2 = chan_init(1);
    pthread_t th1;
    pthread_create(&th1, NULL, proc1, NULL);
    chan_send_buf(c1, &v0, sizeof(List_int));
    List_int v1;
    chan_recv_buf(c2, &v1, sizeof(List_int));
    pthread_join(th1, NULL);
    chan_dispose(c1);
    chan_dispose(c2);
    return v1;
}