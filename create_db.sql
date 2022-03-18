CREATE TABLE contact
(
    id bigint NOT NULL,
    phone_number character varying(32) NOT NULL,
    email character varying(128),
    profile_link text,
    PRIMARY KEY (id),
    UNIQUE (email),
    UNIQUE (profile_link)
);

CREATE TABLE medical_card
(
    id bigint NOT NULL,
    client_status "char",
    med_status "char",
    registry_dt date NOT NULL,
    comment text,
    PRIMARY KEY (id)
);

CREATE TABLE address
(
    id bigint NOT NULL,
    contact_id bigint NOT NULL,
    country_id bigint NOT NULL,
    city character varying(255) NOT NULL,
    index integer,
    street character varying(255) NOT NULL,
    building character varying(32) NOT NULL,
    flat character varying(32),
    PRIMARY KEY (id)
    CONSTRAINT contact_id FOREIGN KEY (contact_id)
        REFERENCES contact (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE person_data
(
    id bigint NOT NULL,
    last_name character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    birth_dt date NOT NULL,
    age smallint,
    sex "char" NOT NULL,
    contact_id bigint NOT NULL,
    medical_card_id bigint NOT NULL,
    parent_id bigint,
    PRIMARY KEY (id),
    UNIQUE (medical_card_id),
    CONSTRAINT contact_id FOREIGN KEY (contact_id)
        REFERENCES contact (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT medical_card_id FOREIGN KEY (medical_card_id)
        REFERENCES medical_card (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE illness
(
    id bigint NOT NULL,
    medical_card_id bigint NOT NULL,
    type_id bigint,
    heaviness "char",
    appearance_dttm timestamp without time zone NOT NULL,
    recovery_dt date,
    PRIMARY KEY (id),
    CONSTRAINT medical_card_id FOREIGN KEY (medical_card_id)
        REFERENCES medical_card (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS person_data
    ADD CONSTRAINT parent_id FOREIGN KEY (parent_id)
    REFERENCES person_data (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (1, '8', '1', '2018/06/07', 'in faucibus orci luctus et ultrices posuere cubilia');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (2, '1', '1', '2018/01/02', 'turpis a');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (3, '2', '6', '2019/03/15', 'nunc viverra dapibus nulla suscipit ligula');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (4, '3', '8', '2017/12/18', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (5, '3', '0', '2016/05/02', 'et magnis dis parturient montes nascetur');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (6, '6', '4', '2022/02/04', 'justo maecenas');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (7, '5', '2', '2021/01/08', 'tincidunt nulla mollis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (8, '5', '7', '2021/06/24', 'luctus et ultrices posuere cubilia curae donec pharetra');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (9, '3', '4', '2019/06/26', 'orci pede venenatis non sodales sed');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (10, '5', '3', '2016/09/10', 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (11, '5', '1', '2016/07/29', 'mus vivamus vestibulum sagittis sapien');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (12, '3', '7', '2021/10/26', 'malesuada in imperdiet et');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (13, '2', '9', '2019/10/04', 'aenean fermentum donec');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (14, '1', '1', '2018/11/02', 'commodo placerat praesent');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (15, '1', '5', '2018/01/04', 'augue aliquam erat volutpat in');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (16, '1', '5', '2018/12/28', 'nam congue risus semper porta volutpat quam');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (17, '9', '2', '2021/10/22', 'sed vel enim sit amet nunc viverra');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (18, '8', '3', '2021/08/06', 'purus phasellus in felis donec semper sapien a libero');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (19, '3', '2', '2021/06/29', 'augue vestibulum ante ipsum primis in faucibus orci luctus et');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (20, '7', '3', '2017/11/06', 'nullam varius nulla facilisi cras non velit nec nisi vulputate');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (21, '0', '1', '2016/12/04', 'ac est lacinia');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (22, '8', '6', '2018/08/25', 'quam');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (23, '7', '5', '2019/09/01', 'vestibulum ante ipsum primis in faucibus orci luctus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (24, '8', '4', '2021/11/01', 'suspendisse ornare consequat lectus in est risus auctor');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (25, '7', '8', '2020/11/07', 'vel pede morbi porttitor lorem');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (26, '7', '0', '2019/07/18', 'quis libero nullam sit amet turpis elementum ligula');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (27, '7', '4', '2016/06/15', 'viverra pede ac');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (28, '2', '9', '2019/12/15', 'donec dapibus duis at velit eu est');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (29, '5', '2', '2016/05/25', 'aliquet at feugiat non');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (30, '5', '1', '2016/12/17', 'ridiculus mus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (31, '4', '2', '2021/07/09', 'adipiscing lorem vitae mattis nibh ligula nec');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (32, '8', '7', '2016/10/27', 'posuere felis sed lacus morbi');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (33, '4', '0', '2021/02/24', 'consequat nulla nisl nunc nisl duis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (34, '0', '4', '2020/03/27', 'nulla nunc purus phasellus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (35, '6', '3', '2018/10/27', 'duis bibendum felis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (36, '1', '9', '2022/02/18', 'est et tempus semper');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (37, '2', '4', '2019/02/23', 'elit ac nulla');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (38, '9', '3', '2016/05/28', 'mauris');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (39, '0', '5', '2016/12/26', 'cras mi pede malesuada in imperdiet et commodo vulputate');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (40, '5', '1', '2021/04/03', 'sodales sed tincidunt eu felis fusce');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (41, '1', '7', '2017/02/21', 'quis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (42, '0', '9', '2016/11/12', 'nunc vestibulum ante ipsum primis in faucibus orci luctus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (43, '9', '6', '2018/01/11', 'amet eleifend pede libero quis orci nullam molestie nibh');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (44, '9', '8', '2017/09/22', 'sit amet erat nulla tempus vivamus in felis eu sapien');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (45, '3', '0', '2019/05/02', 'sagittis nam congue risus semper porta volutpat');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (46, '3', '1', '2021/08/07', 'luctus et ultrices posuere');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (47, '8', '1', '2020/01/22', 'faucibus accumsan');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (48, '9', '0', '2020/10/05', 'vulputate');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (49, '3', '0', '2016/12/30', 'quis odio consequat varius integer ac leo pellentesque ultrices mattis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (50, '4', '0', '2017/08/07', 'integer aliquet');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (51, '4', '7', '2019/07/30', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (52, '2', '6', '2020/07/28', 'a ipsum integer a nibh in quis justo maecenas rhoncus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (53, '6', '0', '2018/02/13', 'quisque id justo sit amet sapien dignissim');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (54, '4', '5', '2019/02/18', 'vestibulum eget vulputate ut ultrices');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (55, '4', '6', '2021/07/03', 'auctor gravida sem praesent id massa id nisl venenatis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (56, '3', '8', '2020/02/21', 'luctus et ultrices posuere cubilia curae mauris viverra');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (57, '8', '6', '2020/01/22', 'justo maecenas rhoncus aliquam lacus morbi quis tortor');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (58, '8', '9', '2019/01/10', 'sapien');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (59, '3', '5', '2021/08/27', 'fusce posuere felis sed lacus morbi sem mauris laoreet ut');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (60, '9', '1', '2016/11/23', 'suspendisse potenti in eleifend quam');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (61, '5', '9', '2017/04/17', 'fermentum justo nec condimentum neque sapien placerat ante');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (62, '7', '5', '2019/12/19', 'a nibh in quis justo');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (63, '9', '5', '2019/10/31', 'vestibulum ante ipsum primis in faucibus orci luctus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (64, '7', '0', '2021/01/20', 'morbi non lectus aliquam sit amet diam in');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (65, '4', '5', '2018/05/06', 'donec ut mauris eget massa tempor convallis nulla neque libero');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (66, '7', '6', '2017/06/08', 'viverra eget congue eget semper rutrum nulla nunc');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (67, '8', '6', '2021/11/15', 'odio justo sollicitudin ut suscipit a feugiat et eros');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (68, '6', '7', '2021/11/22', 'nulla');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (69, '9', '3', '2018/11/23', 'est lacinia nisi venenatis tristique fusce congue');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (70, '1', '4', '2018/02/24', 'integer non velit donec diam neque vestibulum');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (71, '7', '1', '2019/06/03', 'eleifend quam');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (72, '8', '5', '2020/04/29', 'nunc donec quis orci eget orci vehicula condimentum curabitur in');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (73, '1', '1', '2016/06/10', 'massa id nisl venenatis lacinia aenean sit amet justo');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (74, '0', '3', '2020/11/26', 'pellentesque eget nunc donec');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (75, '5', '9', '2018/02/18', 'faucibus accumsan odio curabitur convallis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (76, '4', '3', '2018/01/03', 'consequat varius integer ac');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (77, '1', '1', '2018/09/21', 'ac');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (78, '0', '0', '2017/10/05', 'euismod scelerisque quam turpis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (79, '1', '5', '2019/11/20', 'aliquet ultrices erat tortor sollicitudin mi sit amet');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (80, '4', '5', '2017/08/22', 'non velit donec diam neque vestibulum eget');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (81, '4', '6', '2017/09/05', 'sapien urna pretium nisl ut volutpat sapien arcu');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (82, '3', '0', '2018/11/23', 'tortor risus dapibus augue');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (83, '5', '1', '2020/02/08', 'tortor');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (84, '5', '6', '2017/04/25', 'felis fusce posuere felis sed');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (85, '1', '7', '2021/09/22', 'eu massa donec dapibus duis at');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (86, '4', '4', '2018/04/10', 'placerat');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (87, '0', '6', '2019/08/22', 'convallis duis consequat dui nec');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (88, '0', '6', '2016/08/23', 'dolor');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (89, '0', '3', '2017/07/06', 'nunc commodo placerat praesent blandit nam nulla integer pede justo');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (90, '3', '1', '2017/07/31', 'lorem ipsum dolor sit amet consectetuer adipiscing');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (91, '0', '6', '2018/08/03', 'nulla tellus in sagittis dui vel nisl duis');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (92, '2', '6', '2021/10/26', 'quisque erat eros viverra eget congue');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (93, '8', '1', '2018/06/30', 'et commodo vulputate justo in');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (94, '0', '1', '2021/11/03', 'etiam faucibus cursus urna ut tellus nulla ut erat id');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (95, '9', '0', '2018/06/04', 'lacus purus aliquet at feugiat non pretium quis lectus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (96, '9', '4', '2022/02/18', 'arcu libero rutrum ac lobortis vel dapibus');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (97, '6', '1', '2019/08/04', 'in congue');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (98, '3', '4', '2019/11/01', 'faucibus cursus urna');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (99, '3', '0', '2016/08/05', 'feugiat non pretium');
    insert into medical_inst.medical_card (id, client_status, med_status, registry_dt, comment) values (100, '1', '5', '2018/05/25', 'feugiat non pretium quis lectus');

    ---------------------------------------------------------------------------

    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (1, 1, 1, '4', '2018-04-05 09:53:57', '2017/12/23');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (2, 2, 2, '9', '2016-08-03 20:53:26', '2019/05/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (3, 3, 3, '9', '2022-03-03 09:59:07', '2019/08/26');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (4, 4, 4, '2', '2019-07-03 21:16:51', '2017/06/15');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (5, 5, 5, '9', '2019-07-11 22:32:00', '2021/04/05');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (6, 6, 6, '0', '2022-03-11 01:58:30', '2020/09/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (7, 7, 7, '2', '2020-03-01 20:46:38', '2020/05/05');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (8, 8, 8, '5', '2018-11-01 06:06:02', '2020/02/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (9, 9, 9, '4', '2020-05-07 20:35:47', '2021/10/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (10, 10, 10, '4', '2020-01-19 21:51:10', '2020/12/29');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (11, 11, 11, '7', '2021-03-04 04:51:40', '2018/04/20');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (12, 12, 12, '0', '2016-10-01 11:17:21', '2018/10/21');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (13, 13, 13, '2', '2020-06-08 03:44:20', '2016/11/13');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (14, 14, 14, '5', '2020-09-14 20:47:40', '2017/11/17');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (15, 15, 15, '1', '2021-11-01 02:39:13', '2018/02/21');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (16, 16, 16, '2', '2018-02-03 15:11:48', '2016/07/30');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (17, 17, 17, '4', '2019-08-31 04:04:03', '2018/02/18');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (18, 18, 18, '7', '2020-01-27 21:11:50', '2016/10/17');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (19, 19, 19, '8', '2019-02-09 03:51:13', '2019/05/09');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (20, 20, 20, '0', '2021-04-27 03:24:19', '2018/10/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (21, 21, 21, '0', '2019-10-26 16:50:31', '2019/06/09');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (22, 22, 22, '4', '2018-06-18 01:19:57', '2016/08/07');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (23, 23, 23, '6', '2019-10-08 03:24:16', '2021/09/21');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (24, 24, 24, '1', '2019-06-14 09:19:47', '2018/06/21');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (25, 25, 25, '6', '2018-03-27 05:36:53', '2018/12/02');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (26, 26, 26, '7', '2016-09-28 21:59:57', '2021/10/31');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (27, 27, 27, '2', '2022-03-08 01:31:57', '2016/11/04');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (28, 28, 28, '8', '2017-04-14 05:40:30', '2016/10/04');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (29, 29, 29, '2', '2020-03-13 14:54:16', '2017/07/16');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (30, 30, 30, '4', '2021-03-14 09:23:34', '2018/08/24');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (31, 31, 31, '4', '2020-04-09 18:32:04', '2021/11/03');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (32, 32, 32, '4', '2021-11-07 06:30:04', '2020/04/29');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (33, 33, 33, '4', '2020-06-19 21:41:12', '2021/10/19');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (34, 34, 34, '5', '2020-03-18 11:14:34', '2021/04/12');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (35, 35, 35, '9', '2016-05-03 14:24:30', '2021/10/22');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (36, 36, 36, '2', '2020-08-16 18:19:23', '2016/08/20');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (37, 37, 37, '9', '2019-07-30 11:40:54', '2020/06/23');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (38, 38, 38, '3', '2022-01-18 20:59:51', '2019/05/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (39, 39, 39, '2', '2021-08-21 19:54:01', '2020/04/17');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (40, 40, 40, '6', '2017-08-10 14:48:09', '2020/10/17');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (41, 41, 41, '9', '2021-09-02 00:14:58', '2021/05/30');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (42, 42, 42, '9', '2021-01-20 15:43:43', '2020/11/18');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (43, 43, 43, '4', '2017-03-08 18:12:03', '2020/07/22');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (44, 44, 44, '0', '2017-12-06 15:25:24', '2021/05/05');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (45, 45, 45, '5', '2022-02-06 22:32:53', '2021/04/18');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (46, 46, 46, '5', '2016-09-22 01:23:03', '2021/09/22');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (47, 47, 47, '2', '2019-05-16 22:02:38', '2018/02/22');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (48, 48, 48, '4', '2020-07-19 17:32:13', '2020/08/31');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (49, 49, 49, '0', '2016-10-14 19:44:44', '2022/02/03');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (50, 50, 50, '6', '2022-01-20 03:28:20', '2018/06/02');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (51, 51, 51, '0', '2018-03-12 07:37:03', '2017/11/10');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (52, 52, 52, '2', '2021-12-05 23:31:16', '2020/08/11');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (53, 53, 53, '9', '2020-10-11 16:16:26', '2019/01/27');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (54, 54, 54, '0', '2019-10-21 19:56:06', '2017/06/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (55, 55, 55, '2', '2017-12-19 11:20:09', '2020/09/05');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (56, 56, 56, '9', '2021-07-13 10:36:00', '2017/12/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (57, 57, 57, '2', '2017-07-19 05:24:22', '2021/02/20');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (58, 58, 58, '4', '2021-10-21 01:31:11', '2016/05/02');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (59, 59, 59, '2', '2017-10-06 09:35:28', '2018/12/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (60, 60, 60, '6', '2017-05-22 15:34:28', '2018/10/02');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (61, 61, 61, '3', '2020-07-30 09:58:50', '2021/09/06');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (62, 62, 62, '1', '2020-10-22 23:27:10', '2020/09/01');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (63, 63, 63, '7', '2017-09-10 16:27:18', '2018/05/03');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (64, 64, 64, '4', '2020-10-07 07:20:48', '2019/04/13');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (65, 65, 65, '7', '2020-05-27 13:00:45', '2016/06/15');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (66, 66, 66, '6', '2017-06-25 06:51:23', '2020/03/30');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (67, 67, 67, '0', '2019-09-29 14:09:28', '2017/09/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (68, 68, 68, '3', '2021-04-13 03:58:05', '2017/03/08');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (69, 69, 69, '3', '2017-06-26 07:06:37', '2020/06/04');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (70, 70, 70, '3', '2020-05-09 09:59:27', '2021/06/13');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (71, 71, 71, '8', '2020-07-08 18:48:05', '2020/10/12');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (72, 72, 72, '3', '2019-02-27 16:43:44', '2019/06/22');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (73, 73, 73, '9', '2016-08-15 18:35:38', '2021/10/22');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (74, 74, 74, '8', '2019-11-06 16:26:05', '2016/09/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (75, 75, 75, '4', '2016-05-19 12:56:25', '2020/10/10');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (76, 76, 76, '4', '2019-05-15 11:32:05', '2018/06/15');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (77, 77, 77, '8', '2017-03-17 17:07:05', '2016/08/11');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (78, 78, 78, '5', '2017-03-30 22:30:08', '2020/03/18');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (79, 79, 79, '1', '2019-08-04 03:29:50', '2017/04/21');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (80, 80, 80, '6', '2018-05-17 08:50:02', '2021/12/07');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (81, 81, 81, '3', '2018-12-13 19:24:53', '2021/06/02');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (82, 82, 82, '7', '2019-01-25 23:40:05', '2016/12/29');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (83, 83, 83, '2', '2018-04-12 02:09:58', '2019/06/10');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (84, 84, 84, '8', '2021-04-05 08:04:49', '2016/08/17');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (85, 85, 85, '0', '2021-07-13 20:24:08', '2021/08/16');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (86, 86, 86, '0', '2017-04-11 10:18:10', '2021/08/27');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (87, 87, 87, '5', '2017-05-02 09:58:53', '2021/06/03');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (88, 88, 88, '5', '2020-12-08 18:27:37', '2018/07/23');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (89, 89, 89, '7', '2020-11-14 06:03:40', '2019/01/27');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (90, 90, 90, '4', '2021-11-02 12:37:16', '2017/05/30');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (91, 91, 91, '0', '2019-09-11 09:19:15', '2020/02/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (92, 92, 92, '9', '2019-09-04 06:01:37', '2020/07/05');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (93, 93, 93, '8', '2018-05-22 02:18:24', '2019/10/31');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (94, 94, 94, '0', '2022-01-09 07:29:18', '2021/02/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (95, 95, 95, '3', '2022-01-17 19:06:54', '2016/10/25');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (96, 96, 96, '9', '2020-08-09 16:08:41', '2016/07/28');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (97, 97, 97, '9', '2018-02-03 13:12:57', '2021/08/01');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (98, 98, 98, '7', '2022-01-22 07:11:40', '2017/03/02');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (99, 99, 99, '9', '2018-05-06 12:59:37', '2019/12/05');
    insert into medical_inst.illness (id, medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) values (100, 100, 100, '0', '2016-12-07 21:00:14', '2019/07/16');

    ---------------------------------------------------------------------------------

    insert into medical_inst.contact (id, phone_number, email, profile_link) values (1, '415-910-1884', 'lredihough0@facebook.com', 'svca3384qlyd');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (2, '876-813-7452', 'lgrigori1@dmoz.org', 'rcyp3714rznl');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (3, '129-257-2816', 'lcluelow2@bloglines.com', 'onjp7415rzym');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (4, '154-572-7284', 'fponter3@ovh.net', 'nywj2282ymox');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (5, '137-137-3632', 'browbottam4@omniture.com', 'ncfq7391ronk');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (6, '942-469-2621', 'bwonfar5@yahoo.co.jp', 'ozcg9546unuz');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (7, '969-849-7983', 'choltum6@howstuffworks.com', 'nolk6842fgnu');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (8, '602-812-6324', 'qjeffs7@newyorker.com', 'wass7218ncgv');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (9, '927-521-4308', 'gmclean8@oaic.gov.au', 'oksm0928ycdg');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (10, '572-702-3592', 'alipyeat9@123-reg.co.uk', 'olwo3059sjnm');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (11, '349-782-4744', 'fmackellena@springer.com', 'ctbm8604ealf');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (12, '637-293-2230', 'lbristerb@google.ca', 'suxz4217lbxe');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (13, '727-413-7866', 'bandriulisc@cocolog-nifty.com', 'cjjk3672yzmf');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (14, '912-258-7554', 'pdunkerlyd@house.gov', 'vlgg5035xmmd');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (15, '707-333-9659', 'pdelahayee@sphinn.com', 'vloc9375hclf');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (16, '659-979-2826', 'gclemenzaf@techcrunch.com', 'lenn0775jghn');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (17, '327-545-7883', 'ktemblettg@sakura.ne.jp', 'nunm5671qwlm');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (18, '848-852-2779', 'kgostageh@usa.gov', 'avfy3537iljw');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (19, '366-618-3814', 'dcolebourni@cisco.com', 'phpi0233xkiu');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (20, '353-388-9518', 'ystegerj@nba.com', 'beer5939jvxz');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (21, '803-719-2906', 'unilesk@123-reg.co.uk', 'buae7059nxnk');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (22, '464-437-7301', 'ksantorol@kickstarter.com', 'yolv6831tbfy');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (23, '895-110-3127', 'tparadesm@elpais.com', 'gvfx7982ikfl');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (24, '779-263-8152', 'londricekn@amazonaws.com', 'frth3180mshv');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (25, '115-499-6992', 'jrunnallso@whitehouse.gov', 'lqvb8653lwrp');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (26, '304-314-0977', 'sjeannonp@posterous.com', 'ocjy0233vtrx');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (27, '759-381-5656', 'cdelafontq@usnews.com', 'unrh4240kesi');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (28, '920-968-5739', 'ggamer@webeden.co.uk', 'qumm3366muxd');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (29, '630-339-5885', 'gmanclarks@yellowbook.com', 'bfbt5798yzbs');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (30, '896-304-0903', 'hmorcht@artisteer.com', 'tgbt3319ujsc');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (31, '738-369-0980', 'febbageu@wix.com', 'zkry6893lxzd');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (32, '200-241-6382', 'edussyv@ox.ac.uk', 'yjbo3820wwpe');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (33, '130-121-4327', 'tguilletonw@wired.com', 'akji3939dnzq');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (34, '263-900-1636', 'cspoffordx@msu.edu', 'zuqv2816qtrf');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (35, '901-767-6158', 'dmaharryy@drupal.org', 'lgml1795kbix');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (36, '360-663-2459', 'ccalbaithez@odnoklassniki.ru', 'mxwf1862uocq');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (37, '326-395-8831', 'ematyas10@epa.gov', 'krxr6155stgw');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (38, '321-906-5123', 'vfahy11@oaic.gov.au', 'nejt6662cecy');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (39, '550-885-5851', 'nwickwar12@businessweek.com', 'jtnb5757vegs');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (40, '363-198-8545', 'mmanz13@geocities.jp', 'ofhn6456ejom');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (41, '915-988-6526', 'hgosby14@hibu.com', 'fsbl6664augj');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (42, '987-679-0847', 'lwhitelock15@usa.gov', 'sxvg8788amou');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (43, '359-135-1380', 'ddiggell16@paypal.com', 'sadv9464ebht');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (44, '842-172-2408', 'mrodolico17@ow.ly', 'tpau1750mhnh');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (45, '506-973-2187', 'ahurnell18@sbwire.com', 'qckr0531wfgo');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (46, '564-625-6290', 'porhrt19@yahoo.com', 'coqv2611huyd');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (47, '501-470-5544', 'dcoskerry1a@washington.edu', 'qkss8343lcbv');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (48, '407-420-3246', 'ljacobsz1b@house.gov', 'bozw4831xwvc');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (49, '523-268-8369', 'gcaris1c@cdc.gov', 'njmc8145gzhc');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (50, '681-171-3214', 'iblackesland1d@163.com', 'cfxn0560rirt');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (51, '521-469-0861', 'agreally1e@blogtalkradio.com', 'gpxo7131farr');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (52, '833-863-6534', 'dslograve1f@cdbaby.com', 'mbxf8273sttz');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (53, '191-469-7777', 'cwhetnell1g@mozilla.org', 'jwhj7164ciem');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (54, '698-225-8753', 'mklemmt1h@zimbio.com', 'pbpn8062shjj');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (55, '920-585-5722', 'mhoston1i@geocities.com', 'syzm9497hqec');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (56, '293-555-1794', 'igonneau1j@reverbnation.com', 'fycs0180jklc');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (57, '931-967-6439', 'wsuckling1k@indiegogo.com', 'ykxa3531iykt');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (58, '926-205-0941', 'gmattiassi1l@biblegateway.com', 'nxrq5162tdll');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (59, '251-225-8410', 'kkivelle1m@yelp.com', 'pelm1391njbk');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (60, '687-159-0653', 'vjerred1n@blogspot.com', 'qdmp9472dccf');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (61, '609-168-5024', 'amacphee1o@blogtalkradio.com', 'ahfz3861tlfe');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (62, '833-989-6765', 'ecaneo1p@unc.edu', 'fufg6179xvyv');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (63, '578-443-5138', 'bcranidge1q@census.gov', 'gwnp8336bzot');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (64, '881-959-5285', 'spharo1r@ocn.ne.jp', 'jxwj5876ukxg');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (65, '826-652-4430', 'fkingwell1s@uiuc.edu', 'getj3811qgce');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (66, '337-289-8092', 'jeccleshare1t@dropbox.com', 'pjtu5938jzvw');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (67, '120-485-1609', 'hmarlowe1u@vimeo.com', 'gwhn0845ixmy');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (68, '803-174-1926', 'kgrzegorecki1v@com.com', 'ospe1760qprh');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (69, '919-876-9937', 'apyffe1w@plala.or.jp', 'ptql8488kxqr');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (70, '794-849-3014', 'fhurcombe1x@pen.io', 'zleq9334efeo');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (71, '877-405-5008', 'jpittendreigh1y@kickstarter.com', 'hkcp1755scka');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (72, '786-346-7337', 'fdecent1z@sphinn.com', 'brea5709xboa');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (73, '317-773-9571', 'msavil20@google.cn', 'wcnh6060coki');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (74, '302-469-1266', 'btolwood21@aboutads.info', 'bfil1191fenb');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (75, '646-720-9239', 'dangliss22@opera.com', 'vxzv9225xukw');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (76, '139-562-3209', 'jmumford23@aboutads.info', 'wunm2380sild');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (77, '215-745-8738', 'aasch24@unicef.org', 'yjjk8364swyh');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (78, '576-495-0859', 'ydisman25@google.com.au', 'sqgv1325xdgh');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (79, '561-619-5823', 'ffeldmark26@cnn.com', 'uhqx9897uiem');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (80, '482-641-7180', 'pgittis27@nhs.uk', 'xkyg9637qpws');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (81, '570-596-0690', 'smatuszynski28@bizjournals.com', 'tvfz5151gtpo');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (82, '297-720-4929', 'ckleinlerer29@aboutads.info', 'cdma4291aral');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (83, '814-502-6689', 'cdews2a@springer.com', 'frxu2061jhly');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (84, '626-870-0049', 'cshouler2b@simplemachines.org', 'nvja1167vbbm');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (85, '161-791-6234', 'soconnell2c@lulu.com', 'oolr4284xiqp');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (86, '726-176-7095', 'mwaith2d@forbes.com', 'tnru8099tdmv');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (87, '240-703-8410', 'wjeeves2e@dagondesign.com', 'gauw2164guan');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (88, '135-359-1378', 'snewbury2f@opera.com', 'mmaf4311kzie');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (89, '926-279-4434', 'gbuckwell2g@dyndns.org', 'lgxz0321iezv');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (90, '743-310-0657', 'babell2h@e-recht24.de', 'zuwm5308wndk');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (91, '950-812-7677', 'hdecaville2i@shutterfly.com', 'xzex1060wnwf');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (92, '391-297-4109', 'emccardle2j@yellowpages.com', 'dzgw4362jjvj');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (93, '435-192-1628', 'cmclucas2k@histats.com', 'xwso5237midy');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (94, '993-222-8951', 'htessyman2l@4shared.com', 'nfda9694plin');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (95, '208-825-7828', 'jgudyer2m@icq.com', 'ofoh8323gskn');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (96, '128-951-1501', 'zlaban2n@slideshare.net', 'xeqo8631tyli');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (97, '129-893-0703', 'mhalpin2o@uiuc.edu', 'nodx1167fkry');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (98, '675-817-8725', 'twyeld2p@list-manage.com', 'bwno5860mfvg');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (99, '804-975-7562', 'nbaszniak2q@oakley.com', 'cpog2000xzbw');
    insert into medical_inst.contact (id, phone_number, email, profile_link) values (100, '115-523-4898', 'mcarwithen2r@fc2.com', 'yedm9491gdns');

    ----------------------------------------------------------------

    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (1, 1, 1, 'pbjp400bljo', '2761175', 'alhf0657uaod', 'cwoj9830bhwn', 'cqon2529baja');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (2, 2, 2, 'oqpy628njgy', '4014673', 'imfl9091rfja', 'rcmr9767rfdc', 'utiy9458vudu');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (3, 3, 3, 'dwhk369ddkl', '4409377', 'deyv2165ttnh', 'akbi1539krdo', 'zlcw1513nmeo');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (4, 4, 4, 'muwt732pppa', '8770333', 'huqw6741dhka', 'wbqr4162aknw', 'odmb7887hblq');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (5, 5, 5, 'utyj869sqtc', '4387074', 'ohyk4420ylzv', 'hylg2017ctzq', 'qhxh8583wgpk');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (6, 6, 6, 'bqhq839qkun', '0015509', 'brmr2340nivx', 'oyjz6583gygu', 'jkvw2516uyzp');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (7, 7, 7, 'deoz773buhl', '8846279', 'vfhk8481rkfx', 'wxqy6535bmpd', 'mzmx0841pxyw');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (8, 8, 8, 'jzfz592pwco', '6945898', 'ulau0953ktwr', 'porl1134gqft', 'xqcn2061tkjc');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (9, 9, 9, 'hhay205zuky', '7687157', 'hblw0939eamh', 'wgrb0693gysf', 'ljaa9070kbcj');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (10, 10, 10, 'flyn265zvsg', '1849156', 'yliq4167qojy', 'gggc1428ycgf', 'qqdk6947hpyw');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (11, 11, 11, 'odml224mzbg', '7025048', 'npwj5045iioj', 'dkxx5004mxjn', 'gwhj7084nenk');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (12, 12, 12, 'ywld181fwug', '5392344', 'tedc6696axwc', 'vuoh3289mpih', 'ihil0046zfac');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (13, 13, 13, 'umvj749dnwc', '6341015', 'resi0262prtz', 'jzbu6983svgv', 'yvxe0653iagv');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (14, 14, 14, 'xlvy345rjly', '1441629', 'vyow8878dnqx', 'ttkl0507gyye', 'xcbt7789cmid');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (15, 15, 15, 'qcxs715cxyx', '1188798', 'fmkm9560nlph', 'wgfr1566msox', 'euos9420ngvf');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (16, 16, 16, 'fpuc157chhn', '6351263', 'kgui5009lynz', 'wijf5321tnox', 'zypa6663wequ');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (17, 17, 17, 'qggs823trfi', '6501787', 'nhgw9493spfh', 'wegg0345gylj', 'rcip3232ibgi');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (18, 18, 18, 'iegc994suah', '1221889', 'ykrq2742fjkl', 'lnsa9029pyrf', 'wdur2763ywvs');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (19, 19, 19, 'mfdk375phqm', '7312102', 'nryi2509wztj', 'gria5863wgnc', 'pmfo0620xnme');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (20, 20, 20, 'ysff032tayt', '9433531', 'fznt1079uild', 'iqct0859jyrt', 'udid1392kitj');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (21, 21, 21, 'yjqp047xhbs', '8014047', 'irkw0946jipw', 'jyxc7667qwdu', 'kqug1062uzof');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (22, 22, 22, 'xavz382audh', '4981837', 'tbcz8008asyn', 'cmlf6289lvom', 'mydf3395ugsz');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (23, 23, 23, 'hpfr668efeq', '1759954', 'mcqo0084xjtb', 'ucwk2560zjrb', 'jfpu2135koxx');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (24, 24, 24, 'znet104bnbb', '4699412', 'kxti8037dwhe', 'vstk4735miof', 'dmgp6204ioqi');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (25, 25, 25, 'xdmy111okpx', '2720614', 'uywi7406liqw', 'futl2768ewni', 'fvis2723unum');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (26, 26, 26, 'oxnb646npgy', '8727551', 'talj1594wepg', 'gmgl5980wpll', 'uujo6113rlxo');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (27, 27, 27, 'avvf503xdld', '0760655', 'rbwu7259ynsh', 'nfja4883blnc', 'yhgi7108wzau');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (28, 28, 28, 'ohle672qqih', '4882260', 'prxw7183ords', 'pksj7086cyws', 'xblu0416zrhs');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (29, 29, 29, 'seqt892gmid', '3828878', 'xeqb9023yewt', 'lqba2732pjhf', 'qhqw1893wqyp');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (30, 30, 30, 'tbtc106coco', '6910380', 'avpa7291ngnq', 'ciqp2731dryt', 'myvx8653kefr');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (31, 31, 31, 'lchj879kpqt', '2184442', 'nhkz4686jrpt', 'bhyl3719deki', 'scqj4006vyek');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (32, 32, 32, 'cprv581itht', '3412310', 'loyv1648lzfp', 'eeou5273pccw', 'mggw7673ktdk');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (33, 33, 33, 'uaeu262evpo', '0443960', 'jydn3456eqzc', 'wuly5641rrcv', 'xxne2036jdqf');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (34, 34, 34, 'rxxu820ycht', '3348228', 'vvuk5434ecyn', 'jaou0847cxhl', 'nnmc1777czka');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (35, 35, 35, 'xigq630tkzf', '1964962', 'igey5799kwwv', 'iphn8140zdvy', 'ayqu0140dhhh');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (36, 36, 36, 'dphm893qnwf', '2443149', 'zwlx5517lulq', 'nafj3090xenh', 'xyye2706dswq');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (37, 37, 37, 'yokq021snwa', '7954961', 'hnxw6570gruf', 'tvsp4430doom', 'mzyg4672ouut');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (38, 38, 38, 'xvhe188kplp', '6267581', 'tetq1649ppsf', 'epcv6124mmmr', 'csit7550pavp');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (39, 39, 39, 'aoyo488uzru', '1059384', 'uvuu0822dkpu', 'dnjv2787ztra', 'zjas0784vhul');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (40, 40, 40, 'ucmi889fqsr', '1831837', 'jnio8920nnpc', 'yapv2738dspf', 'uozg9679vveh');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (41, 41, 41, 'atfv814tbyv', '1027987', 'vcnl9260vcox', 'ifky5398mecs', 'brqr6252hlov');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (42, 42, 42, 'vfmk250bfwm', '2638457', 'ygoa1818gyra', 'ston5702xvsa', 'oqre9916dlkh');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (43, 43, 43, 'xjxw258iolj', '7299612', 'upsp4259lsbk', 'nxvt3383wmig', 'jttg0135ytyw');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (44, 44, 44, 'gqnb989xcbn', '1406816', 'spdh4952gbos', 'fsof6093qorg', 'jmhx6040ilku');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (45, 45, 45, 'nagj417amkk', '0705925', 'bywa4375unuy', 'jsbp4859ylbx', 'momh9341rxoj');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (46, 46, 46, 'zxut634qput', '3447102', 'mwpn1875ttwr', 'owzj9639laxb', 'dadr3209cauc');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (47, 47, 47, 'dlwd070eqnl', '4250350', 'uoyj4220pxor', 'tuqn6922njdz', 'xsxy3012aova');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (48, 48, 48, 'twzp933ztbe', '2830264', 'vrsz3112duar', 'fywy4161yjmr', 'ikxr0917jxbx');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (49, 49, 49, 'ngnq596xqqf', '2020905', 'jcdv5789rftg', 'nvox6685mtuq', 'nugp7320vzmz');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (50, 50, 50, 'ssdm033orwi', '6522916', 'qjyi8655ccwg', 'laqg0649nwtp', 'lfjm8189hwzq');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (51, 51, 51, 'gold041qyhy', '3321369', 'axvp0000ugos', 'btya9105tvzw', 'pwcl0011ienm');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (52, 52, 52, 'elmz754ddus', '0719133', 'gern8301iikj', 'zjdw5573cyoo', 'tuyl2200cbbl');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (53, 53, 53, 'sdrf008aulq', '2980111', 'wdjk0636oftn', 'sfyr4946twbz', 'moaf9955clit');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (54, 54, 54, 'wqdq318vvso', '5357574', 'iemg1561biqs', 'rhhh9720ujcg', 'lfth2944srij');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (55, 55, 55, 'ieda990lyuv', '2227044', 'tfuo1958gurp', 'xtnq0496hswm', 'qygf8359ejyy');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (56, 56, 56, 'ueqz429mdxe', '9958315', 'mtja9571zcvv', 'lsnn6271ekia', 'nvov5221cmeg');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (57, 57, 57, 'vfhs694ivbl', '3029444', 'txri3851aabq', 'lejx0369jqws', 'jivv7316vihu');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (58, 58, 58, 'bwwo761onmi', '5212532', 'lpgi5906oynb', 'hvij2638fpzx', 'tjyp6295npjt');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (59, 59, 59, 'fvjl748jnyo', '9355703', 'guxh2594cman', 'qtwe5452tiay', 'mxhk2963vcyn');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (60, 60, 60, 'womo568olxm', '9573469', 'wmrw8793wyxy', 'irsl5663oedb', 'quky4187oagc');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (61, 61, 61, 'hied019zeqr', '8939798', 'zyqc1122xarq', 'xgvc5727twcn', 'hbhs0308mqxj');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (62, 62, 62, 'mzgr216jxwn', '7602121', 'rdcs8391rozu', 'nowr4771goxs', 'rcox4137nuzz');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (63, 63, 63, 'njpb766ioja', '9853840', 'fojp6584jvdp', 'nnfw0589suql', 'drql6703ftbk');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (64, 64, 64, 'qior358xiwt', '0694030', 'nozj4729kkcg', 'zzal8910odof', 'ojap4203fign');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (65, 65, 65, 'igrg321fijw', '3229205', 'fobh8072ssfy', 'kvwi0883tjjp', 'znfv9239dpux');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (66, 66, 66, 'ajef109vumu', '8702635', 'zrxk2973kudd', 'rgut8544ihqi', 'ulhg8064rbik');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (67, 67, 67, 'rpaz937fenk', '4986922', 'gokp3824cufk', 'rjov3625xezo', 'qqzf1541vlwx');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (68, 68, 68, 'zzmr548nvbz', '2309920', 'hezy4490tfhm', 'uaes8425auof', 'hgyo5508ubyz');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (69, 69, 69, 'qtbk547khoj', '3663411', 'lter2384kwfi', 'livy5940cuie', 'ocgi4303rzon');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (70, 70, 70, 'tdos313ptxf', '0608956', 'hltc0555kmbj', 'ghtq7598kzja', 'bowz5836qquo');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (71, 71, 71, 'dvsc546drzm', '7420583', 'wpfx6547faoc', 'nsrz8823auan', 'dnjy5966jmqp');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (72, 72, 72, 'psqr048rkyn', '4821357', 'ftul0535ekxo', 'bpnq7017bfgx', 'wtnj6080pran');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (73, 73, 73, 'ajrt858tpjs', '3275147', 'kcrd4427kerb', 'kqon2695ulqs', 'oshr1664uclh');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (74, 74, 74, 'fsaj102lypm', '4185230', 'hfvj0609gfje', 'jcqf4031rtkn', 'qtym0106ddat');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (75, 75, 75, 'azrm359gkzu', '1627392', 'fqla2847uyvo', 'rzik1353bguh', 'avfs1580tzga');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (76, 76, 76, 'uuux760kvhu', '7779664', 'grfa0515eupw', 'bggz0747emvl', 'mmyc9232jagd');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (77, 77, 77, 'nzoz773bjfj', '5184645', 'ciff4876zjji', 'ncat0674mrhq', 'ahup8621msdb');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (78, 78, 78, 'ooub355jrud', '3634560', 'pkxd5028yjpq', 'todr0478codv', 'kuta4681eqor');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (79, 79, 79, 'vrmc520lebo', '3210374', 'ucdh2346npsm', 'elgt5870xmzq', 'gkot6736doec');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (80, 80, 80, 'nbdk858xpog', '0279719', 'xreg8861qckt', 'zxyn1981islc', 'hqcs3004hhxu');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (81, 81, 81, 'hlsf508sywk', '8096088', 'lfed3792zmqs', 'yfmt1578iepj', 'xqfp4759mlor');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (82, 82, 82, 'eviv310mnzl', '0807618', 'bhqw3052mmvk', 'ywqy0910hnlu', 'xjoy3438mtme');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (83, 83, 83, 'lxps977nmtx', '9382288', 'buey4158cees', 'yxtj3443ykbs', 'dhkt5899fjvc');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (84, 84, 84, 'cete661hlyn', '4365725', 'jljp1905tkfx', 'zwbu0867jnzp', 'nqim0556jrfh');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (85, 85, 85, 'uabw145akgn', '9484769', 'nqzr0124itex', 'kypm9957ajud', 'mpkf2655aflk');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (86, 86, 86, 'dsru645esfp', '4446197', 'qjns4319znun', 'zdqr6348vrvc', 'xpnl2276kceu');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (87, 87, 87, 'ecpo713jfos', '6225763', 'jdgt0826rmdt', 'tjpo5152mazu', 'zuci8460yrsg');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (88, 88, 88, 'bngv510mhgy', '4193519', 'xpqz2645fmix', 'zdoq6074zmmb', 'qtmz7348llfl');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (89, 89, 89, 'yepq829dpwf', '8053166', 'tgei5894nhpl', 'hxdj3548imhv', 'fxjq3148qgvl');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (90, 90, 90, 'kvme583wgeb', '5989234', 'mzim9469lnyb', 'hevu9850orzg', 'bjlx7422ivep');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (91, 91, 91, 'ikyf554hzcg', '1896356', 'hrsn0659kkqv', 'eqvt2072vfna', 'mqog8235jrve');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (92, 92, 92, 'jscs728mtay', '4165678', 'sylf2203isuj', 'osic5132wjbe', 'rnbf5482ubnu');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (93, 93, 93, 'oqbp670ncgg', '6888082', 'tfaf9864jmsg', 'rhvo9968xsyb', 'xomq4851vaxj');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (94, 94, 94, 'teqf435znkp', '4592496', 'asok0555bxvo', 'cckg7814rddf', 'pbym5123smws');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (95, 95, 95, 'kmid971dusr', '8999429', 'nolr3404joqz', 'hkjl4635rruc', 'pzfc4042itzn');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (96, 96, 96, 'gmdc734hyts', '9926581', 'prvf2881fuio', 'alcl5184xvjl', 'aihl8732wkzb');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (97, 97, 97, 'wfxe278wcmd', '3644307', 'bbyc7441wezt', 'doee1307exbz', 'urdx6760trpf');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (98, 98, 98, 'lxyt439ksff', '4886310', 'gniz2266mncw', 'qnht3045yvit', 'defx6870pemc');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (99, 99, 99, 'egjz389alzl', '8595282', 'fwkb5786tnzb', 'guqo3265zkjy', 'xpti1215kjnm');
    insert into medical_inst.address (id, contact_id, country_id, city, index, street, building, flat) values (100, 100, 100, 'qotv044heoy', '0554590', 'etko4746hynl', 'jeav2618zyde', 'lvnn1605zhtm');

    ----------------------------------------------------------------------

    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (1, 'tfnvtkvnjsu', 'mtrnlstwym', '2019/11/28', '88', 'c', 1, 1, 1);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (2, 'ahtfptmnggv', 'vkmsaharjy', '2016/09/11', '26', 'm', 2, 2, 2);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (3, 'qassjkwlhma', 'rkfzhmccek', '2020/12/06', '90', 'u', 3, 3, 3);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (4, 'mpcjfbnesgg', 'pezkxxmhoe', '2021/08/02', '10', 't', 4, 4, 4);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (5, 'axtjdvccbhn', 'xxykhovhtf', '2021/08/31', '81', 'c', 5, 5, 5);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (6, 'hatfnqlghwk', 'udzwymdtzd', '2019/03/15', '67', 'x', 6, 6, 6);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (7, 'wdtyriywksw', 'sdfyylvwci', '2018/04/14', '19', 'p', 7, 7, 7);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (8, 'aacoabxkiru', 'wemwknvnnm', '2018/10/04', '72', 'h', 8, 8, 8);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (9, 'jtbaupvuetd', 'fyhpffdqgv', '2017/03/25', '10', 'g', 9, 9, 9);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (10, 'tvnmwradnka', 'ussvkmtqmo', '2017/08/16', '23', 'p', 10, 10, 10);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (11, 'utpmmyiybnf', 'dvnectnywl', '2018/11/11', '62', 'v', 11, 11, 11);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (12, 'rhzygmlcett', 'usvtzrgqxw', '2017/04/11', '69', 'd', 12, 12, 12);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (13, 'pghehlwomuq', 'xnsmdjecln', '2020/04/09', '69', 'a', 13, 13, 13);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (14, 'mrhxtvwmfqr', 'hxoamjdrty', '2017/10/22', '97', 'q', 14, 14, 14);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (15, 'mghjrcitawx', 'uwnwpvgbpi', '2021/02/07', '81', 's', 15, 15, 15);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (16, 'zasrsoxusdw', 'vfitzoaiep', '2021/05/31', '38', 'm', 16, 16, 16);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (17, 'mavdhuelfwx', 'wcgowgiarn', '2016/07/28', '20', 'h', 17, 17, 17);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (18, 'kanyzrftxtt', 'yuzvtqxxfv', '2019/02/06', '27', 's', 18, 18, 18);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (19, 'aiiepqrfndz', 'cfcehbojyu', '2020/12/29', '78', 'd', 19, 19, 19);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (20, 'kyzlmqhfada', 'mlgvotyiln', '2016/12/26', '48', 'h', 20, 20, 20);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (21, 'zzbramlafbj', 'ejcuiwpdjt', '2019/11/28', '26', 'u', 21, 21, 21);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (22, 'rzvejowbgdg', 'rsovuaazru', '2020/08/12', '04', 'r', 22, 22, 22);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (23, 'dsmwlobgtsd', 'wrerbqkiti', '2018/11/15', '80', 'w', 23, 23, 23);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (24, 'apiwdqunkbi', 'nehuitqqdt', '2018/02/16', '06', 'f', 24, 24, 24);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (25, 'fowiidcnjxc', 'bxhajqjram', '2016/07/18', '83', 'i', 25, 25, 25);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (26, 'mfegvpwpgel', 'nnvsibrzcg', '2021/04/08', '56', 'v', 26, 26, 26);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (27, 'stasdfsuali', 'smxrrfomga', '2018/10/12', '04', 'r', 27, 27, 27);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (28, 'cvvwosutsor', 'jsbknsingm', '2019/04/06', '21', 'j', 28, 28, 28);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (29, 'bugxlxexjtu', 'atsfuqffwn', '2021/06/06', '76', 'o', 29, 29, 29);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (30, 'vmkuyxjeqmb', 'nwwzeqgnkc', '2021/05/05', '32', 'o', 30, 30, 30);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (31, 'xsdoyiwsbdi', 'pnvcbyzqiy', '2018/02/21', '52', 'd', 31, 31, 31);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (32, 'lnleycmyfrn', 'rpfyplwmbq', '2019/04/24', '81', 'q', 32, 32, 32);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (33, 'abdourtzjwx', 'duudkmryzm', '2019/05/06', '97', 'k', 33, 33, 33);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (34, 'czzgonshebt', 'ozshzsgqqg', '2019/09/06', '61', 'g', 34, 34, 34);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (35, 'anpjnpnecjo', 'csekzyzfdq', '2018/03/31', '47', 'k', 35, 35, 35);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (36, 'ltocpdujlir', 'tykizmpvzj', '2020/05/21', '13', 'x', 36, 36, 36);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (37, 'dzqarceydlw', 'uenxwuoubd', '2018/01/17', '13', 'f', 37, 37, 37);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (38, 'zdkmlnvejbw', 'lfgdhykfld', '2017/07/23', '88', 'i', 38, 38, 38);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (39, 'cbzsccbtyxn', 'lkcjfdgnxu', '2022/02/16', '18', 'z', 39, 39, 39);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (40, 'ngsnhwlgpcx', 'xwldalubuz', '2017/06/05', '41', 'l', 40, 40, 40);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (41, 'aabhxpvmcta', 'tlxjdnprro', '2020/04/18', '41', 'x', 41, 41, 41);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (42, 'scxfnrtttpz', 'mzulqqhdcn', '2020/07/20', '96', 'n', 42, 42, 42);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (43, 'lrwclzrwboq', 'qgipnjphyi', '2020/03/16', '55', 'b', 43, 43, 43);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (44, 'vagmmlhqhyn', 'rqwclwvjnb', '2021/12/05', '88', 'c', 44, 44, 44);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (45, 'avtjcdsqivs', 'zawmfxyclu', '2021/02/03', '39', 'e', 45, 45, 45);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (46, 'nkishgxblyo', 'jkzgmsvycz', '2019/10/27', '11', 'r', 46, 46, 46);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (47, 'ebbnegqjxfl', 'fdabckyini', '2019/10/12', '33', 'q', 47, 47, 47);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (48, 'zvpeptbkesl', 'fedvhivbxp', '2017/07/09', '40', 'r', 48, 48, 48);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (49, 'yklraxtqrsi', 'pvvffbbrxi', '2019/06/01', '61', 'p', 49, 49, 49);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (50, 'rkjruoavcei', 'ytiyjjxvhh', '2021/10/15', '65', 'l', 50, 50, 50);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (51, 'pbelewpvuyz', 'hulvycinuv', '2019/07/31', '54', 'a', 51, 51, 51);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (52, 'qsddgdjzpnb', 'uzbuoqpnln', '2021/03/28', '10', 'l', 52, 52, 52);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (53, 'rxrpiwbjpph', 'xpnbhgvker', '2020/02/27', '15', 'o', 53, 53, 53);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (54, 'naeniltmfpu', 'qyryiaclqx', '2020/01/22', '27', 'h', 54, 54, 54);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (55, 'pcjasrjxjdh', 'dclyuxkjbt', '2022/03/09', '54', 'n', 55, 55, 55);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (56, 'ozkgnpbxtdc', 'fesnbcfesz', '2021/10/07', '73', 'w', 56, 56, 56);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (57, 'gcdystlrhue', 'daettuyfzc', '2020/12/20', '18', 'c', 57, 57, 57);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (58, 'vvypjgfkapd', 'kqyhcdpszz', '2021/10/09', '95', 'd', 58, 58, 58);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (59, 'izzekbmlmvz', 'iafzndtngo', '2018/08/15', '68', 'q', 59, 59, 59);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (60, 'xcwdpvlojmh', 'mxlbojiukz', '2016/11/14', '92', 't', 60, 60, 60);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (61, 'fkufgliajlz', 'hztuildiuc', '2020/09/18', '88', 'l', 61, 61, 61);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (62, 'kgqzhdybrhh', 'onhclxgsrq', '2018/12/28', '90', 'k', 62, 62, 62);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (63, 'osqkxwnzivd', 'nhtphupsjb', '2021/10/22', '50', 'p', 63, 63, 63);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (64, 'uukqpqndhdz', 'vrpzdwmvdg', '2019/04/10', '34', 'j', 64, 64, 64);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (65, 'tmsdubemjfm', 'lawwfbhrae', '2017/02/02', '83', 'k', 65, 65, 65);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (66, 'zyhnqhsuljx', 'ncupreyktn', '2021/03/25', '09', 't', 66, 66, 66);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (67, 'ngkpcdguphe', 'eyoqblpuex', '2020/05/12', '81', 'i', 67, 67, 67);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (68, 'oxtbzfeurrt', 'bcxnkvdenh', '2018/10/28', '98', 'z', 68, 68, 68);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (69, 'wixmwslwsvr', 'jxbzppvrum', '2020/10/15', '10', 't', 69, 69, 69);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (70, 'ixmhoqokbwc', 'wrbwzpcakl', '2017/12/21', '28', 'f', 70, 70, 70);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (71, 'jlxfzszfiwq', 'piapsmttoq', '2017/03/21', '55', 'n', 71, 71, 71);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (72, 'pcjdlyyshug', 'kwwoytwatq', '2020/11/27', '12', 'q', 72, 72, 72);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (73, 'pwxgsvoofpf', 'qkiczwuyyy', '2017/05/18', '82', 'r', 73, 73, 73);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (74, 'baviwswwhgl', 'jofdsydqks', '2021/02/02', '85', 'z', 74, 74, 74);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (75, 'vionnadayyn', 'koqhgsmxrh', '2017/10/06', '55', 'm', 75, 75, 75);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (76, 'skocylcozeq', 'slrjuhexqr', '2022/01/09', '00', 'r', 76, 76, 76);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (77, 'hktzfrknsbn', 'nhtwmmryhj', '2020/01/29', '88', 'l', 77, 77, 77);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (78, 'eylrgoxpbmk', 'alnxepgcne', '2017/05/29', '65', 't', 78, 78, 78);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (79, 'hyeqlschpxi', 'dpdqpugazf', '2018/09/28', '82', 'i', 79, 79, 79);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (80, 'ozqrgabeget', 'jbbrnvdtsx', '2021/09/12', '17', 'y', 80, 80, 80);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (81, 'tntxcupcfbv', 'iwbqszfyam', '2017/11/05', '65', 'p', 81, 81, 81);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (82, 'eclogzhpihu', 'qyjedvwkrw', '2017/09/16', '46', 't', 82, 82, 82);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (83, 'vbyzozoafkt', 'zihvxfyczz', '2017/11/24', '98', 'z', 83, 83, 83);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (84, 'tkefgivvvqc', 'rordhlgocp', '2016/06/09', '57', 'm', 84, 84, 84);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (85, 'vvnmesdspth', 'dawyviitov', '2019/05/14', '14', 'j', 85, 85, 85);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (86, 'clzvgubtnrc', 'pgjcthcamz', '2020/06/23', '48', 'h', 86, 86, 86);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (87, 'cmqaqvdptqf', 'dytphnhqmn', '2019/08/21', '27', 'q', 87, 87, 87);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (88, 'fyrefwmhppb', 'tvqjngpril', '2019/07/04', '53', 'o', 88, 88, 88);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (89, 'lzftzmgswgz', 'lymaamxqba', '2018/12/24', '21', 't', 89, 89, 89);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (90, 'hbdepwihgem', 'hqlqnrohlf', '2016/10/21', '28', 'z', 90, 90, 90);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (91, 'izkjibhjhqa', 'trdijphpok', '2020/10/21', '49', 'h', 91, 91, 91);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (92, 'lqakucdtyxc', 'izebwxztmg', '2016/06/17', '74', 'v', 92, 92, 92);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (93, 'dvfwfwdvwsf', 'uexcmvczhs', '2020/04/16', '88', 'u', 93, 93, 93);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (94, 'erlyyjziwbs', 'iimdcmkpsk', '2017/04/10', '97', 'q', 94, 94, 94);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (95, 'amrnfttncrl', 'qnkzbumoal', '2018/06/20', '43', 'j', 95, 95, 95);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (96, 'kgzainmwmab', 'txsuiqlhpo', '2018/12/13', '13', 'i', 96, 96, 96);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (97, 'obuwdylrsmq', 'hjndabpfkr', '2018/02/02', '28', 'c', 97, 97, 97);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (98, 'pveegkcsbvf', 'ydpquqyawe', '2016/05/10', '87', 'j', 98, 98, 98);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (99, 'acgnadgekqw', 'bsqgtvniix', '2021/03/11', '70', 'l', 99, 99, 99);
    insert into medical_inst.person_data (id, last_name, first_name, birth_dt, age, sex, contact_id, medical_card_id, parent_id) values (100, 'tvxpjmucyzd', 'mhanjevghu', '2020/09/15', '71', 'a', 100, 100, 100);