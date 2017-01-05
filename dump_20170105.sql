--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: varchar_ci; Type: DOMAIN; Schema: public; Owner: gus
--

CREATE DOMAIN varchar_ci AS character varying(255) NOT NULL DEFAULT ''::character varying;


ALTER DOMAIN varchar_ci OWNER TO "gus";

--
-- Name: _varchar_ci_equal(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: gus
--

CREATE FUNCTION _varchar_ci_equal(varchar_ci, varchar_ci) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$SELECT LOWER($1) = LOWER($2)$_$;


ALTER FUNCTION public._varchar_ci_equal(varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: _varchar_ci_greater_equals(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: gus
--

CREATE FUNCTION _varchar_ci_greater_equals(varchar_ci, varchar_ci) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$SELECT LOWER($1) >= LOWER($2)$_$;


ALTER FUNCTION public._varchar_ci_greater_equals(varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: _varchar_ci_greater_than(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: gus
--

CREATE FUNCTION _varchar_ci_greater_than(varchar_ci, varchar_ci) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$SELECT LOWER($1) > LOWER($2)$_$;


ALTER FUNCTION public._varchar_ci_greater_than(varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: _varchar_ci_less_equal(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: gus
--

CREATE FUNCTION _varchar_ci_less_equal(varchar_ci, varchar_ci) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$SELECT LOWER($1) <= LOWER($2)$_$;


ALTER FUNCTION public._varchar_ci_less_equal(varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: _varchar_ci_less_than(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: gus
--

CREATE FUNCTION _varchar_ci_less_than(varchar_ci, varchar_ci) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$SELECT LOWER($1) < LOWER($2)$_$;


ALTER FUNCTION public._varchar_ci_less_than(varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: _varchar_ci_not_equal(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: gus
--

CREATE FUNCTION _varchar_ci_not_equal(varchar_ci, varchar_ci) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$SELECT LOWER($1) != LOWER($2)$_$;


ALTER FUNCTION public._varchar_ci_not_equal(varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: gus
--

CREATE OPERATOR < (
    PROCEDURE = _varchar_ci_less_than,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: gus
--

CREATE OPERATOR <= (
    PROCEDURE = _varchar_ci_less_equal,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: <>; Type: OPERATOR; Schema: public; Owner: gus
--

CREATE OPERATOR <> (
    PROCEDURE = _varchar_ci_not_equal,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: gus
--

CREATE OPERATOR = (
    PROCEDURE = _varchar_ci_equal,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = =,
    NEGATOR = <>,
    MERGES,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: gus
--

CREATE OPERATOR > (
    PROCEDURE = _varchar_ci_greater_than,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (varchar_ci, varchar_ci) OWNER TO "gus";

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: gus
--

CREATE OPERATOR >= (
    PROCEDURE = _varchar_ci_greater_equals,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (varchar_ci, varchar_ci) OWNER TO "gus";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attack; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE attack (
    id integer NOT NULL,
    target_id integer,
    name character varying(255) NOT NULL,
    stars integer,
    date_creation timestamp(0) without time zone NOT NULL,
    date_maj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    destruction double precision,
    timer_start timestamp(0) without time zone NOT NULL,
    timer_end timestamp(0) without time zone NOT NULL,
    date_result timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    first_star_win boolean,
    second_star_win boolean,
    third_star_win boolean,
    hdv integer
);


ALTER TABLE attack OWNER TO "gus";

--
-- Name: attack_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE attack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attack_id_seq OWNER TO "gus";

--
-- Name: categories; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    root_id integer,
    parent_id integer,
    title text NOT NULL,
    lft integer NOT NULL,
    lvl integer NOT NULL,
    rgt integer NOT NULL
);


ALTER TABLE categories OWNER TO "gus";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "gus";

--
-- Name: clan; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE clan (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    level integer NOT NULL,
    description text,
    timer integer,
    date_creation timestamp(0) without time zone NOT NULL,
    date_maj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    type integer NOT NULL,
    tag character varying(255) NOT NULL
);


ALTER TABLE clan OWNER TO "gus";

--
-- Name: clan_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE clan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clan_id_seq OWNER TO "gus";

--
-- Name: image; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE image (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    alt character varying(255) NOT NULL
);


ALTER TABLE image OWNER TO "gus";

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE image_id_seq OWNER TO "gus";

--
-- Name: phpbb_acl_groups; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_acl_groups (
    group_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    auth_option_id integer DEFAULT 0 NOT NULL,
    auth_role_id integer DEFAULT 0 NOT NULL,
    auth_setting smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_acl_groups_auth_option_id_check CHECK ((auth_option_id >= 0)),
    CONSTRAINT phpbb_acl_groups_auth_role_id_check CHECK ((auth_role_id >= 0)),
    CONSTRAINT phpbb_acl_groups_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_acl_groups_group_id_check CHECK ((group_id >= 0))
);


ALTER TABLE phpbb_acl_groups OWNER TO "gus";

--
-- Name: phpbb_acl_options_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_acl_options_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_acl_options_seq OWNER TO "gus";

--
-- Name: phpbb_acl_options; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_acl_options (
    auth_option_id integer DEFAULT nextval('phpbb_acl_options_seq'::regclass) NOT NULL,
    auth_option character varying(50) DEFAULT ''::character varying NOT NULL,
    is_global smallint DEFAULT 0::smallint NOT NULL,
    is_local smallint DEFAULT 0::smallint NOT NULL,
    founder_only smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_acl_options_auth_option_id_check CHECK ((auth_option_id >= 0)),
    CONSTRAINT phpbb_acl_options_founder_only_check CHECK ((founder_only >= 0)),
    CONSTRAINT phpbb_acl_options_is_global_check CHECK ((is_global >= 0)),
    CONSTRAINT phpbb_acl_options_is_local_check CHECK ((is_local >= 0))
);


ALTER TABLE phpbb_acl_options OWNER TO "gus";

--
-- Name: phpbb_acl_roles_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_acl_roles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_acl_roles_seq OWNER TO "gus";

--
-- Name: phpbb_acl_roles; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_acl_roles (
    role_id integer DEFAULT nextval('phpbb_acl_roles_seq'::regclass) NOT NULL,
    role_name character varying(255) DEFAULT ''::character varying NOT NULL,
    role_description character varying(4000) DEFAULT ''::character varying NOT NULL,
    role_type character varying(10) DEFAULT ''::character varying NOT NULL,
    role_order smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_acl_roles_role_id_check CHECK ((role_id >= 0)),
    CONSTRAINT phpbb_acl_roles_role_order_check CHECK ((role_order >= 0))
);


ALTER TABLE phpbb_acl_roles OWNER TO "gus";

--
-- Name: phpbb_acl_roles_data; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_acl_roles_data (
    role_id integer DEFAULT 0 NOT NULL,
    auth_option_id integer DEFAULT 0 NOT NULL,
    auth_setting smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_acl_roles_data_auth_option_id_check CHECK ((auth_option_id >= 0)),
    CONSTRAINT phpbb_acl_roles_data_role_id_check CHECK ((role_id >= 0))
);


ALTER TABLE phpbb_acl_roles_data OWNER TO "gus";

--
-- Name: phpbb_acl_users; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_acl_users (
    user_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    auth_option_id integer DEFAULT 0 NOT NULL,
    auth_role_id integer DEFAULT 0 NOT NULL,
    auth_setting smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_acl_users_auth_option_id_check CHECK ((auth_option_id >= 0)),
    CONSTRAINT phpbb_acl_users_auth_role_id_check CHECK ((auth_role_id >= 0)),
    CONSTRAINT phpbb_acl_users_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_acl_users_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_acl_users OWNER TO "gus";

--
-- Name: phpbb_attachments_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_attachments_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_attachments_seq OWNER TO "gus";

--
-- Name: phpbb_attachments; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_attachments (
    attach_id integer DEFAULT nextval('phpbb_attachments_seq'::regclass) NOT NULL,
    post_msg_id integer DEFAULT 0 NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    in_message smallint DEFAULT 0::smallint NOT NULL,
    poster_id integer DEFAULT 0 NOT NULL,
    is_orphan smallint DEFAULT 1::smallint NOT NULL,
    physical_filename character varying(255) DEFAULT ''::character varying NOT NULL,
    real_filename character varying(255) DEFAULT ''::character varying NOT NULL,
    download_count integer DEFAULT 0 NOT NULL,
    attach_comment character varying(4000) DEFAULT ''::character varying NOT NULL,
    extension character varying(100) DEFAULT ''::character varying NOT NULL,
    mimetype character varying(100) DEFAULT ''::character varying NOT NULL,
    filesize integer DEFAULT 0 NOT NULL,
    filetime integer DEFAULT 0 NOT NULL,
    thumbnail smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_attachments_attach_id_check CHECK ((attach_id >= 0)),
    CONSTRAINT phpbb_attachments_download_count_check CHECK ((download_count >= 0)),
    CONSTRAINT phpbb_attachments_filesize_check CHECK ((filesize >= 0)),
    CONSTRAINT phpbb_attachments_filetime_check CHECK ((filetime >= 0)),
    CONSTRAINT phpbb_attachments_in_message_check CHECK ((in_message >= 0)),
    CONSTRAINT phpbb_attachments_is_orphan_check CHECK ((is_orphan >= 0)),
    CONSTRAINT phpbb_attachments_post_msg_id_check CHECK ((post_msg_id >= 0)),
    CONSTRAINT phpbb_attachments_poster_id_check CHECK ((poster_id >= 0)),
    CONSTRAINT phpbb_attachments_thumbnail_check CHECK ((thumbnail >= 0)),
    CONSTRAINT phpbb_attachments_topic_id_check CHECK ((topic_id >= 0))
);


ALTER TABLE phpbb_attachments OWNER TO "gus";

--
-- Name: phpbb_banlist_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_banlist_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_banlist_seq OWNER TO "gus";

--
-- Name: phpbb_banlist; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_banlist (
    ban_id integer DEFAULT nextval('phpbb_banlist_seq'::regclass) NOT NULL,
    ban_userid integer DEFAULT 0 NOT NULL,
    ban_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    ban_email character varying(100) DEFAULT ''::character varying NOT NULL,
    ban_start integer DEFAULT 0 NOT NULL,
    ban_end integer DEFAULT 0 NOT NULL,
    ban_exclude smallint DEFAULT 0::smallint NOT NULL,
    ban_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    ban_give_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_banlist_ban_end_check CHECK ((ban_end >= 0)),
    CONSTRAINT phpbb_banlist_ban_exclude_check CHECK ((ban_exclude >= 0)),
    CONSTRAINT phpbb_banlist_ban_id_check CHECK ((ban_id >= 0)),
    CONSTRAINT phpbb_banlist_ban_start_check CHECK ((ban_start >= 0)),
    CONSTRAINT phpbb_banlist_ban_userid_check CHECK ((ban_userid >= 0))
);


ALTER TABLE phpbb_banlist OWNER TO "gus";

--
-- Name: phpbb_bbcodes; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_bbcodes (
    bbcode_id smallint DEFAULT 0::smallint NOT NULL,
    bbcode_tag character varying(16) DEFAULT ''::character varying NOT NULL,
    bbcode_helpline character varying(255) DEFAULT ''::character varying NOT NULL,
    display_on_posting smallint DEFAULT 0::smallint NOT NULL,
    bbcode_match character varying(4000) DEFAULT ''::character varying NOT NULL,
    bbcode_tpl text DEFAULT ''::text NOT NULL,
    first_pass_match text DEFAULT ''::text NOT NULL,
    first_pass_replace text DEFAULT ''::text NOT NULL,
    second_pass_match text DEFAULT ''::text NOT NULL,
    second_pass_replace text DEFAULT ''::text NOT NULL,
    CONSTRAINT phpbb_bbcodes_bbcode_id_check CHECK ((bbcode_id >= 0)),
    CONSTRAINT phpbb_bbcodes_display_on_posting_check CHECK ((display_on_posting >= 0))
);


ALTER TABLE phpbb_bbcodes OWNER TO "gus";

--
-- Name: phpbb_bookmarks; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_bookmarks (
    topic_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_bookmarks_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_bookmarks_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_bookmarks OWNER TO "gus";

--
-- Name: phpbb_bots_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_bots_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_bots_seq OWNER TO "gus";

--
-- Name: phpbb_bots; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_bots (
    bot_id integer DEFAULT nextval('phpbb_bots_seq'::regclass) NOT NULL,
    bot_active smallint DEFAULT 1::smallint NOT NULL,
    bot_name character varying(255) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    bot_agent character varying(255) DEFAULT ''::character varying NOT NULL,
    bot_ip character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_bots_bot_active_check CHECK ((bot_active >= 0)),
    CONSTRAINT phpbb_bots_bot_id_check CHECK ((bot_id >= 0)),
    CONSTRAINT phpbb_bots_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_bots OWNER TO "gus";

--
-- Name: phpbb_config; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_config (
    config_name character varying(255) DEFAULT ''::character varying NOT NULL,
    config_value character varying(255) DEFAULT ''::character varying NOT NULL,
    is_dynamic smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_config_is_dynamic_check CHECK ((is_dynamic >= 0))
);


ALTER TABLE phpbb_config OWNER TO "gus";

--
-- Name: phpbb_config_text; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_config_text (
    config_name character varying(255) DEFAULT ''::character varying NOT NULL,
    config_value text DEFAULT ''::text NOT NULL
);


ALTER TABLE phpbb_config_text OWNER TO "gus";

--
-- Name: phpbb_confirm; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_confirm (
    confirm_id character(32) DEFAULT ''::bpchar NOT NULL,
    session_id character(32) DEFAULT ''::bpchar NOT NULL,
    confirm_type smallint DEFAULT 0::smallint NOT NULL,
    code character varying(8) DEFAULT ''::character varying NOT NULL,
    seed integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_confirm_attempts_check CHECK ((attempts >= 0)),
    CONSTRAINT phpbb_confirm_seed_check CHECK ((seed >= 0))
);


ALTER TABLE phpbb_confirm OWNER TO "gus";

--
-- Name: phpbb_disallow_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_disallow_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_disallow_seq OWNER TO "gus";

--
-- Name: phpbb_disallow; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_disallow (
    disallow_id integer DEFAULT nextval('phpbb_disallow_seq'::regclass) NOT NULL,
    disallow_username character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_disallow_disallow_id_check CHECK ((disallow_id >= 0))
);


ALTER TABLE phpbb_disallow OWNER TO "gus";

--
-- Name: phpbb_drafts_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_drafts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_drafts_seq OWNER TO "gus";

--
-- Name: phpbb_drafts; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_drafts (
    draft_id integer DEFAULT nextval('phpbb_drafts_seq'::regclass) NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    save_time integer DEFAULT 0 NOT NULL,
    draft_subject character varying(255) DEFAULT ''::character varying NOT NULL,
    draft_message text DEFAULT ''::text NOT NULL,
    CONSTRAINT phpbb_drafts_draft_id_check CHECK ((draft_id >= 0)),
    CONSTRAINT phpbb_drafts_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_drafts_save_time_check CHECK ((save_time >= 0)),
    CONSTRAINT phpbb_drafts_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_drafts_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_drafts OWNER TO "gus";

--
-- Name: phpbb_ext; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_ext (
    ext_name character varying(255) DEFAULT ''::character varying NOT NULL,
    ext_active smallint DEFAULT 0::smallint NOT NULL,
    ext_state character varying(8000) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_ext_ext_active_check CHECK ((ext_active >= 0))
);


ALTER TABLE phpbb_ext OWNER TO "gus";

--
-- Name: phpbb_extension_groups_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_extension_groups_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_extension_groups_seq OWNER TO "gus";

--
-- Name: phpbb_extension_groups; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_extension_groups (
    group_id integer DEFAULT nextval('phpbb_extension_groups_seq'::regclass) NOT NULL,
    group_name character varying(255) DEFAULT ''::character varying NOT NULL,
    cat_id smallint DEFAULT 0::smallint NOT NULL,
    allow_group smallint DEFAULT 0::smallint NOT NULL,
    download_mode smallint DEFAULT 1::smallint NOT NULL,
    upload_icon character varying(255) DEFAULT ''::character varying NOT NULL,
    max_filesize integer DEFAULT 0 NOT NULL,
    allowed_forums character varying(8000) DEFAULT ''::character varying NOT NULL,
    allow_in_pm smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_extension_groups_allow_group_check CHECK ((allow_group >= 0)),
    CONSTRAINT phpbb_extension_groups_allow_in_pm_check CHECK ((allow_in_pm >= 0)),
    CONSTRAINT phpbb_extension_groups_download_mode_check CHECK ((download_mode >= 0)),
    CONSTRAINT phpbb_extension_groups_group_id_check CHECK ((group_id >= 0)),
    CONSTRAINT phpbb_extension_groups_max_filesize_check CHECK ((max_filesize >= 0))
);


ALTER TABLE phpbb_extension_groups OWNER TO "gus";

--
-- Name: phpbb_extensions_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_extensions_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_extensions_seq OWNER TO "gus";

--
-- Name: phpbb_extensions; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_extensions (
    extension_id integer DEFAULT nextval('phpbb_extensions_seq'::regclass) NOT NULL,
    group_id integer DEFAULT 0 NOT NULL,
    extension character varying(100) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_extensions_extension_id_check CHECK ((extension_id >= 0)),
    CONSTRAINT phpbb_extensions_group_id_check CHECK ((group_id >= 0))
);


ALTER TABLE phpbb_extensions OWNER TO "gus";

--
-- Name: phpbb_forums_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_forums_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_forums_seq OWNER TO "gus";

--
-- Name: phpbb_forums; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_forums (
    forum_id integer DEFAULT nextval('phpbb_forums_seq'::regclass) NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    left_id integer DEFAULT 0 NOT NULL,
    right_id integer DEFAULT 0 NOT NULL,
    forum_parents text DEFAULT ''::text NOT NULL,
    forum_name character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_desc character varying(4000) DEFAULT ''::character varying NOT NULL,
    forum_desc_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_desc_options integer DEFAULT 7 NOT NULL,
    forum_desc_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    forum_link character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_password character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_style integer DEFAULT 0 NOT NULL,
    forum_image character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_rules character varying(4000) DEFAULT ''::character varying NOT NULL,
    forum_rules_link character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_rules_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_rules_options integer DEFAULT 7 NOT NULL,
    forum_rules_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    forum_topics_per_page smallint DEFAULT 0::smallint NOT NULL,
    forum_type smallint DEFAULT 0::smallint NOT NULL,
    forum_status smallint DEFAULT 0::smallint NOT NULL,
    forum_last_post_id integer DEFAULT 0 NOT NULL,
    forum_last_poster_id integer DEFAULT 0 NOT NULL,
    forum_last_post_subject character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_last_post_time integer DEFAULT 0 NOT NULL,
    forum_last_poster_name character varying(255) DEFAULT ''::character varying NOT NULL,
    forum_last_poster_colour character varying(6) DEFAULT ''::character varying NOT NULL,
    forum_flags smallint DEFAULT 32::smallint NOT NULL,
    display_on_index smallint DEFAULT 1::smallint NOT NULL,
    enable_indexing smallint DEFAULT 1::smallint NOT NULL,
    enable_icons smallint DEFAULT 1::smallint NOT NULL,
    enable_prune smallint DEFAULT 0::smallint NOT NULL,
    prune_next integer DEFAULT 0 NOT NULL,
    prune_days integer DEFAULT 0 NOT NULL,
    prune_viewed integer DEFAULT 0 NOT NULL,
    prune_freq integer DEFAULT 0 NOT NULL,
    display_subforum_list smallint DEFAULT 1::smallint NOT NULL,
    forum_options integer DEFAULT 0 NOT NULL,
    enable_shadow_prune smallint DEFAULT 0::smallint NOT NULL,
    prune_shadow_days integer DEFAULT 7 NOT NULL,
    prune_shadow_freq integer DEFAULT 1 NOT NULL,
    prune_shadow_next integer DEFAULT 0 NOT NULL,
    forum_posts_approved integer DEFAULT 0 NOT NULL,
    forum_posts_unapproved integer DEFAULT 0 NOT NULL,
    forum_posts_softdeleted integer DEFAULT 0 NOT NULL,
    forum_topics_approved integer DEFAULT 0 NOT NULL,
    forum_topics_unapproved integer DEFAULT 0 NOT NULL,
    forum_topics_softdeleted integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_forums_display_on_index_check CHECK ((display_on_index >= 0)),
    CONSTRAINT phpbb_forums_display_subforum_list_check CHECK ((display_subforum_list >= 0)),
    CONSTRAINT phpbb_forums_enable_icons_check CHECK ((enable_icons >= 0)),
    CONSTRAINT phpbb_forums_enable_indexing_check CHECK ((enable_indexing >= 0)),
    CONSTRAINT phpbb_forums_enable_prune_check CHECK ((enable_prune >= 0)),
    CONSTRAINT phpbb_forums_enable_shadow_prune_check CHECK ((enable_shadow_prune >= 0)),
    CONSTRAINT phpbb_forums_forum_desc_options_check CHECK ((forum_desc_options >= 0)),
    CONSTRAINT phpbb_forums_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_forums_forum_last_post_id_check CHECK ((forum_last_post_id >= 0)),
    CONSTRAINT phpbb_forums_forum_last_post_time_check CHECK ((forum_last_post_time >= 0)),
    CONSTRAINT phpbb_forums_forum_last_poster_id_check CHECK ((forum_last_poster_id >= 0)),
    CONSTRAINT phpbb_forums_forum_options_check CHECK ((forum_options >= 0)),
    CONSTRAINT phpbb_forums_forum_posts_approved_check CHECK ((forum_posts_approved >= 0)),
    CONSTRAINT phpbb_forums_forum_posts_softdeleted_check CHECK ((forum_posts_softdeleted >= 0)),
    CONSTRAINT phpbb_forums_forum_posts_unapproved_check CHECK ((forum_posts_unapproved >= 0)),
    CONSTRAINT phpbb_forums_forum_rules_options_check CHECK ((forum_rules_options >= 0)),
    CONSTRAINT phpbb_forums_forum_style_check CHECK ((forum_style >= 0)),
    CONSTRAINT phpbb_forums_forum_topics_approved_check CHECK ((forum_topics_approved >= 0)),
    CONSTRAINT phpbb_forums_forum_topics_softdeleted_check CHECK ((forum_topics_softdeleted >= 0)),
    CONSTRAINT phpbb_forums_forum_topics_unapproved_check CHECK ((forum_topics_unapproved >= 0)),
    CONSTRAINT phpbb_forums_left_id_check CHECK ((left_id >= 0)),
    CONSTRAINT phpbb_forums_parent_id_check CHECK ((parent_id >= 0)),
    CONSTRAINT phpbb_forums_prune_days_check CHECK ((prune_days >= 0)),
    CONSTRAINT phpbb_forums_prune_freq_check CHECK ((prune_freq >= 0)),
    CONSTRAINT phpbb_forums_prune_next_check CHECK ((prune_next >= 0)),
    CONSTRAINT phpbb_forums_prune_shadow_days_check CHECK ((prune_shadow_days >= 0)),
    CONSTRAINT phpbb_forums_prune_shadow_freq_check CHECK ((prune_shadow_freq >= 0)),
    CONSTRAINT phpbb_forums_prune_viewed_check CHECK ((prune_viewed >= 0)),
    CONSTRAINT phpbb_forums_right_id_check CHECK ((right_id >= 0))
);


ALTER TABLE phpbb_forums OWNER TO "gus";

--
-- Name: phpbb_forums_access; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_forums_access (
    forum_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    session_id character(32) DEFAULT ''::bpchar NOT NULL,
    CONSTRAINT phpbb_forums_access_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_forums_access_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_forums_access OWNER TO "gus";

--
-- Name: phpbb_forums_track; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_forums_track (
    user_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    mark_time integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_forums_track_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_forums_track_mark_time_check CHECK ((mark_time >= 0)),
    CONSTRAINT phpbb_forums_track_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_forums_track OWNER TO "gus";

--
-- Name: phpbb_forums_watch; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_forums_watch (
    forum_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notify_status smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_forums_watch_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_forums_watch_notify_status_check CHECK ((notify_status >= 0)),
    CONSTRAINT phpbb_forums_watch_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_forums_watch OWNER TO "gus";

--
-- Name: phpbb_groups_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_groups_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_groups_seq OWNER TO "gus";

--
-- Name: phpbb_groups; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_groups (
    group_id integer DEFAULT nextval('phpbb_groups_seq'::regclass) NOT NULL,
    group_type smallint DEFAULT 1::smallint NOT NULL,
    group_founder_manage smallint DEFAULT 0::smallint NOT NULL,
    group_skip_auth smallint DEFAULT 0::smallint NOT NULL,
    group_name varchar_ci DEFAULT ''::character varying NOT NULL,
    group_desc character varying(4000) DEFAULT ''::character varying NOT NULL,
    group_desc_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    group_desc_options integer DEFAULT 7 NOT NULL,
    group_desc_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    group_display smallint DEFAULT 0::smallint NOT NULL,
    group_avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    group_avatar_type character varying(255) DEFAULT ''::character varying NOT NULL,
    group_avatar_width smallint DEFAULT 0::smallint NOT NULL,
    group_avatar_height smallint DEFAULT 0::smallint NOT NULL,
    group_rank integer DEFAULT 0 NOT NULL,
    group_colour character varying(6) DEFAULT ''::character varying NOT NULL,
    group_sig_chars integer DEFAULT 0 NOT NULL,
    group_receive_pm smallint DEFAULT 0::smallint NOT NULL,
    group_message_limit integer DEFAULT 0 NOT NULL,
    group_legend integer DEFAULT 0 NOT NULL,
    group_max_recipients integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_groups_group_avatar_height_check CHECK ((group_avatar_height >= 0)),
    CONSTRAINT phpbb_groups_group_avatar_width_check CHECK ((group_avatar_width >= 0)),
    CONSTRAINT phpbb_groups_group_desc_options_check CHECK ((group_desc_options >= 0)),
    CONSTRAINT phpbb_groups_group_display_check CHECK ((group_display >= 0)),
    CONSTRAINT phpbb_groups_group_founder_manage_check CHECK ((group_founder_manage >= 0)),
    CONSTRAINT phpbb_groups_group_id_check CHECK ((group_id >= 0)),
    CONSTRAINT phpbb_groups_group_legend_check CHECK ((group_legend >= 0)),
    CONSTRAINT phpbb_groups_group_max_recipients_check CHECK ((group_max_recipients >= 0)),
    CONSTRAINT phpbb_groups_group_message_limit_check CHECK ((group_message_limit >= 0)),
    CONSTRAINT phpbb_groups_group_rank_check CHECK ((group_rank >= 0)),
    CONSTRAINT phpbb_groups_group_receive_pm_check CHECK ((group_receive_pm >= 0)),
    CONSTRAINT phpbb_groups_group_sig_chars_check CHECK ((group_sig_chars >= 0)),
    CONSTRAINT phpbb_groups_group_skip_auth_check CHECK ((group_skip_auth >= 0))
);


ALTER TABLE phpbb_groups OWNER TO "gus";

--
-- Name: phpbb_icons_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_icons_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_icons_seq OWNER TO "gus";

--
-- Name: phpbb_icons; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_icons (
    icons_id integer DEFAULT nextval('phpbb_icons_seq'::regclass) NOT NULL,
    icons_url character varying(255) DEFAULT ''::character varying NOT NULL,
    icons_width smallint DEFAULT 0::smallint NOT NULL,
    icons_height smallint DEFAULT 0::smallint NOT NULL,
    icons_order integer DEFAULT 0 NOT NULL,
    display_on_posting smallint DEFAULT 1::smallint NOT NULL,
    CONSTRAINT phpbb_icons_display_on_posting_check CHECK ((display_on_posting >= 0)),
    CONSTRAINT phpbb_icons_icons_id_check CHECK ((icons_id >= 0)),
    CONSTRAINT phpbb_icons_icons_order_check CHECK ((icons_order >= 0))
);


ALTER TABLE phpbb_icons OWNER TO "gus";

--
-- Name: phpbb_lang_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_lang_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_lang_seq OWNER TO "gus";

--
-- Name: phpbb_lang; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_lang (
    lang_id smallint DEFAULT nextval('phpbb_lang_seq'::regclass) NOT NULL,
    lang_iso character varying(30) DEFAULT ''::character varying NOT NULL,
    lang_dir character varying(30) DEFAULT ''::character varying NOT NULL,
    lang_english_name character varying(100) DEFAULT ''::character varying NOT NULL,
    lang_local_name character varying(255) DEFAULT ''::character varying NOT NULL,
    lang_author character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE phpbb_lang OWNER TO "gus";

--
-- Name: phpbb_log_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_log_seq OWNER TO "gus";

--
-- Name: phpbb_log; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_log (
    log_id integer DEFAULT nextval('phpbb_log_seq'::regclass) NOT NULL,
    log_type smallint DEFAULT 0::smallint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    reportee_id integer DEFAULT 0 NOT NULL,
    log_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    log_time integer DEFAULT 0 NOT NULL,
    log_operation character varying(4000) DEFAULT ''::character varying NOT NULL,
    log_data text DEFAULT ''::text NOT NULL,
    CONSTRAINT phpbb_log_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_log_log_id_check CHECK ((log_id >= 0)),
    CONSTRAINT phpbb_log_log_time_check CHECK ((log_time >= 0)),
    CONSTRAINT phpbb_log_reportee_id_check CHECK ((reportee_id >= 0)),
    CONSTRAINT phpbb_log_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_log_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_log OWNER TO "gus";

--
-- Name: phpbb_login_attempts; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_login_attempts (
    attempt_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    attempt_browser character varying(150) DEFAULT ''::character varying NOT NULL,
    attempt_forwarded_for character varying(255) DEFAULT ''::character varying NOT NULL,
    attempt_time integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    username character varying(255) DEFAULT '0'::character varying NOT NULL,
    username_clean varchar_ci DEFAULT '0'::character varying NOT NULL,
    CONSTRAINT phpbb_login_attempts_attempt_time_check CHECK ((attempt_time >= 0)),
    CONSTRAINT phpbb_login_attempts_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_login_attempts OWNER TO "gus";

--
-- Name: phpbb_migrations; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_migrations (
    migration_name character varying(255) DEFAULT ''::character varying NOT NULL,
    migration_depends_on character varying(8000) DEFAULT ''::character varying NOT NULL,
    migration_schema_done smallint DEFAULT 0::smallint NOT NULL,
    migration_data_done smallint DEFAULT 0::smallint NOT NULL,
    migration_data_state character varying(8000) DEFAULT ''::character varying NOT NULL,
    migration_start_time integer DEFAULT 0 NOT NULL,
    migration_end_time integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_migrations_migration_data_done_check CHECK ((migration_data_done >= 0)),
    CONSTRAINT phpbb_migrations_migration_end_time_check CHECK ((migration_end_time >= 0)),
    CONSTRAINT phpbb_migrations_migration_schema_done_check CHECK ((migration_schema_done >= 0)),
    CONSTRAINT phpbb_migrations_migration_start_time_check CHECK ((migration_start_time >= 0))
);


ALTER TABLE phpbb_migrations OWNER TO "gus";

--
-- Name: phpbb_moderator_cache; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_moderator_cache (
    forum_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    username character varying(255) DEFAULT ''::character varying NOT NULL,
    group_id integer DEFAULT 0 NOT NULL,
    group_name character varying(255) DEFAULT ''::character varying NOT NULL,
    display_on_index smallint DEFAULT 1::smallint NOT NULL,
    CONSTRAINT phpbb_moderator_cache_display_on_index_check CHECK ((display_on_index >= 0)),
    CONSTRAINT phpbb_moderator_cache_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_moderator_cache_group_id_check CHECK ((group_id >= 0)),
    CONSTRAINT phpbb_moderator_cache_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_moderator_cache OWNER TO "gus";

--
-- Name: phpbb_modules_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_modules_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_modules_seq OWNER TO "gus";

--
-- Name: phpbb_modules; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_modules (
    module_id integer DEFAULT nextval('phpbb_modules_seq'::regclass) NOT NULL,
    module_enabled smallint DEFAULT 1::smallint NOT NULL,
    module_display smallint DEFAULT 1::smallint NOT NULL,
    module_basename character varying(255) DEFAULT ''::character varying NOT NULL,
    module_class character varying(10) DEFAULT ''::character varying NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    left_id integer DEFAULT 0 NOT NULL,
    right_id integer DEFAULT 0 NOT NULL,
    module_langname character varying(255) DEFAULT ''::character varying NOT NULL,
    module_mode character varying(255) DEFAULT ''::character varying NOT NULL,
    module_auth character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_modules_left_id_check CHECK ((left_id >= 0)),
    CONSTRAINT phpbb_modules_module_display_check CHECK ((module_display >= 0)),
    CONSTRAINT phpbb_modules_module_enabled_check CHECK ((module_enabled >= 0)),
    CONSTRAINT phpbb_modules_module_id_check CHECK ((module_id >= 0)),
    CONSTRAINT phpbb_modules_parent_id_check CHECK ((parent_id >= 0)),
    CONSTRAINT phpbb_modules_right_id_check CHECK ((right_id >= 0))
);


ALTER TABLE phpbb_modules OWNER TO "gus";

--
-- Name: phpbb_notification_types_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_notification_types_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_notification_types_seq OWNER TO "gus";

--
-- Name: phpbb_notification_types; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_notification_types (
    notification_type_id smallint DEFAULT nextval('phpbb_notification_types_seq'::regclass) NOT NULL,
    notification_type_name character varying(255) DEFAULT ''::character varying NOT NULL,
    notification_type_enabled smallint DEFAULT 1::smallint NOT NULL,
    CONSTRAINT phpbb_notification_types_notification_type_enabled_check CHECK ((notification_type_enabled >= 0)),
    CONSTRAINT phpbb_notification_types_notification_type_id_check CHECK ((notification_type_id >= 0))
);


ALTER TABLE phpbb_notification_types OWNER TO "gus";

--
-- Name: phpbb_notifications_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_notifications_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_notifications_seq OWNER TO "gus";

--
-- Name: phpbb_notifications; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_notifications (
    notification_id integer DEFAULT nextval('phpbb_notifications_seq'::regclass) NOT NULL,
    notification_type_id smallint DEFAULT 0::smallint NOT NULL,
    item_id integer DEFAULT 0 NOT NULL,
    item_parent_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notification_read smallint DEFAULT 0::smallint NOT NULL,
    notification_time integer DEFAULT 1 NOT NULL,
    notification_data character varying(4000) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_notifications_item_id_check CHECK ((item_id >= 0)),
    CONSTRAINT phpbb_notifications_item_parent_id_check CHECK ((item_parent_id >= 0)),
    CONSTRAINT phpbb_notifications_notification_id_check CHECK ((notification_id >= 0)),
    CONSTRAINT phpbb_notifications_notification_read_check CHECK ((notification_read >= 0)),
    CONSTRAINT phpbb_notifications_notification_time_check CHECK ((notification_time >= 0)),
    CONSTRAINT phpbb_notifications_notification_type_id_check CHECK ((notification_type_id >= 0)),
    CONSTRAINT phpbb_notifications_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_notifications OWNER TO "gus";

--
-- Name: phpbb_oauth_accounts; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_oauth_accounts (
    user_id integer DEFAULT 0 NOT NULL,
    provider character varying(255) DEFAULT ''::character varying NOT NULL,
    oauth_provider_id character varying(4000) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_oauth_accounts_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_oauth_accounts OWNER TO "gus";

--
-- Name: phpbb_oauth_tokens; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_oauth_tokens (
    user_id integer DEFAULT 0 NOT NULL,
    session_id character(32) DEFAULT ''::bpchar NOT NULL,
    provider character varying(255) DEFAULT ''::character varying NOT NULL,
    oauth_token text DEFAULT ''::text NOT NULL,
    CONSTRAINT phpbb_oauth_tokens_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_oauth_tokens OWNER TO "gus";

--
-- Name: phpbb_poll_options; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_poll_options (
    poll_option_id smallint DEFAULT 0::smallint NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    poll_option_text character varying(4000) DEFAULT ''::character varying NOT NULL,
    poll_option_total integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_poll_options_poll_option_total_check CHECK ((poll_option_total >= 0)),
    CONSTRAINT phpbb_poll_options_topic_id_check CHECK ((topic_id >= 0))
);


ALTER TABLE phpbb_poll_options OWNER TO "gus";

--
-- Name: phpbb_poll_votes; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_poll_votes (
    topic_id integer DEFAULT 0 NOT NULL,
    poll_option_id smallint DEFAULT 0::smallint NOT NULL,
    vote_user_id integer DEFAULT 0 NOT NULL,
    vote_user_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_poll_votes_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_poll_votes_vote_user_id_check CHECK ((vote_user_id >= 0))
);


ALTER TABLE phpbb_poll_votes OWNER TO "gus";

--
-- Name: phpbb_posts_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_posts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_posts_seq OWNER TO "gus";

--
-- Name: phpbb_posts; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_posts (
    post_id integer DEFAULT nextval('phpbb_posts_seq'::regclass) NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    poster_id integer DEFAULT 0 NOT NULL,
    icon_id integer DEFAULT 0 NOT NULL,
    poster_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    post_time integer DEFAULT 0 NOT NULL,
    post_reported smallint DEFAULT 0::smallint NOT NULL,
    enable_bbcode smallint DEFAULT 1::smallint NOT NULL,
    enable_smilies smallint DEFAULT 1::smallint NOT NULL,
    enable_magic_url smallint DEFAULT 1::smallint NOT NULL,
    enable_sig smallint DEFAULT 1::smallint NOT NULL,
    post_username character varying(255) DEFAULT ''::character varying NOT NULL,
    post_subject character varying(255) DEFAULT ''::character varying NOT NULL,
    post_text text DEFAULT ''::text NOT NULL,
    post_checksum character varying(32) DEFAULT ''::character varying NOT NULL,
    post_attachment smallint DEFAULT 0::smallint NOT NULL,
    bbcode_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    bbcode_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    post_postcount smallint DEFAULT 1::smallint NOT NULL,
    post_edit_time integer DEFAULT 0 NOT NULL,
    post_edit_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    post_edit_user integer DEFAULT 0 NOT NULL,
    post_edit_count smallint DEFAULT 0::smallint NOT NULL,
    post_edit_locked smallint DEFAULT 0::smallint NOT NULL,
    post_visibility smallint DEFAULT 0::smallint NOT NULL,
    post_delete_time integer DEFAULT 0 NOT NULL,
    post_delete_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    post_delete_user integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_posts_enable_bbcode_check CHECK ((enable_bbcode >= 0)),
    CONSTRAINT phpbb_posts_enable_magic_url_check CHECK ((enable_magic_url >= 0)),
    CONSTRAINT phpbb_posts_enable_sig_check CHECK ((enable_sig >= 0)),
    CONSTRAINT phpbb_posts_enable_smilies_check CHECK ((enable_smilies >= 0)),
    CONSTRAINT phpbb_posts_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_posts_icon_id_check CHECK ((icon_id >= 0)),
    CONSTRAINT phpbb_posts_post_attachment_check CHECK ((post_attachment >= 0)),
    CONSTRAINT phpbb_posts_post_delete_time_check CHECK ((post_delete_time >= 0)),
    CONSTRAINT phpbb_posts_post_delete_user_check CHECK ((post_delete_user >= 0)),
    CONSTRAINT phpbb_posts_post_edit_count_check CHECK ((post_edit_count >= 0)),
    CONSTRAINT phpbb_posts_post_edit_locked_check CHECK ((post_edit_locked >= 0)),
    CONSTRAINT phpbb_posts_post_edit_time_check CHECK ((post_edit_time >= 0)),
    CONSTRAINT phpbb_posts_post_edit_user_check CHECK ((post_edit_user >= 0)),
    CONSTRAINT phpbb_posts_post_id_check CHECK ((post_id >= 0)),
    CONSTRAINT phpbb_posts_post_postcount_check CHECK ((post_postcount >= 0)),
    CONSTRAINT phpbb_posts_post_reported_check CHECK ((post_reported >= 0)),
    CONSTRAINT phpbb_posts_post_time_check CHECK ((post_time >= 0)),
    CONSTRAINT phpbb_posts_poster_id_check CHECK ((poster_id >= 0)),
    CONSTRAINT phpbb_posts_topic_id_check CHECK ((topic_id >= 0))
);


ALTER TABLE phpbb_posts OWNER TO "gus";

--
-- Name: phpbb_privmsgs_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_privmsgs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_privmsgs_seq OWNER TO "gus";

--
-- Name: phpbb_privmsgs; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_privmsgs (
    msg_id integer DEFAULT nextval('phpbb_privmsgs_seq'::regclass) NOT NULL,
    root_level integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    icon_id integer DEFAULT 0 NOT NULL,
    author_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    message_time integer DEFAULT 0 NOT NULL,
    enable_bbcode smallint DEFAULT 1::smallint NOT NULL,
    enable_smilies smallint DEFAULT 1::smallint NOT NULL,
    enable_magic_url smallint DEFAULT 1::smallint NOT NULL,
    enable_sig smallint DEFAULT 1::smallint NOT NULL,
    message_subject character varying(255) DEFAULT ''::character varying NOT NULL,
    message_text text DEFAULT ''::text NOT NULL,
    message_edit_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    message_edit_user integer DEFAULT 0 NOT NULL,
    message_attachment smallint DEFAULT 0::smallint NOT NULL,
    bbcode_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    bbcode_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    message_edit_time integer DEFAULT 0 NOT NULL,
    message_edit_count smallint DEFAULT 0::smallint NOT NULL,
    to_address character varying(4000) DEFAULT ''::character varying NOT NULL,
    bcc_address character varying(4000) DEFAULT ''::character varying NOT NULL,
    message_reported smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_privmsgs_author_id_check CHECK ((author_id >= 0)),
    CONSTRAINT phpbb_privmsgs_enable_bbcode_check CHECK ((enable_bbcode >= 0)),
    CONSTRAINT phpbb_privmsgs_enable_magic_url_check CHECK ((enable_magic_url >= 0)),
    CONSTRAINT phpbb_privmsgs_enable_sig_check CHECK ((enable_sig >= 0)),
    CONSTRAINT phpbb_privmsgs_enable_smilies_check CHECK ((enable_smilies >= 0)),
    CONSTRAINT phpbb_privmsgs_icon_id_check CHECK ((icon_id >= 0)),
    CONSTRAINT phpbb_privmsgs_message_attachment_check CHECK ((message_attachment >= 0)),
    CONSTRAINT phpbb_privmsgs_message_edit_count_check CHECK ((message_edit_count >= 0)),
    CONSTRAINT phpbb_privmsgs_message_edit_time_check CHECK ((message_edit_time >= 0)),
    CONSTRAINT phpbb_privmsgs_message_edit_user_check CHECK ((message_edit_user >= 0)),
    CONSTRAINT phpbb_privmsgs_message_reported_check CHECK ((message_reported >= 0)),
    CONSTRAINT phpbb_privmsgs_message_time_check CHECK ((message_time >= 0)),
    CONSTRAINT phpbb_privmsgs_msg_id_check CHECK ((msg_id >= 0)),
    CONSTRAINT phpbb_privmsgs_root_level_check CHECK ((root_level >= 0))
);


ALTER TABLE phpbb_privmsgs OWNER TO "gus";

--
-- Name: phpbb_privmsgs_folder_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_privmsgs_folder_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_privmsgs_folder_seq OWNER TO "gus";

--
-- Name: phpbb_privmsgs_folder; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_privmsgs_folder (
    folder_id integer DEFAULT nextval('phpbb_privmsgs_folder_seq'::regclass) NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    folder_name character varying(255) DEFAULT ''::character varying NOT NULL,
    pm_count integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_privmsgs_folder_folder_id_check CHECK ((folder_id >= 0)),
    CONSTRAINT phpbb_privmsgs_folder_pm_count_check CHECK ((pm_count >= 0)),
    CONSTRAINT phpbb_privmsgs_folder_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_privmsgs_folder OWNER TO "gus";

--
-- Name: phpbb_privmsgs_rules_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_privmsgs_rules_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_privmsgs_rules_seq OWNER TO "gus";

--
-- Name: phpbb_privmsgs_rules; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_privmsgs_rules (
    rule_id integer DEFAULT nextval('phpbb_privmsgs_rules_seq'::regclass) NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    rule_check integer DEFAULT 0 NOT NULL,
    rule_connection integer DEFAULT 0 NOT NULL,
    rule_string character varying(255) DEFAULT ''::character varying NOT NULL,
    rule_user_id integer DEFAULT 0 NOT NULL,
    rule_group_id integer DEFAULT 0 NOT NULL,
    rule_action integer DEFAULT 0 NOT NULL,
    rule_folder_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_privmsgs_rules_rule_action_check CHECK ((rule_action >= 0)),
    CONSTRAINT phpbb_privmsgs_rules_rule_check_check CHECK ((rule_check >= 0)),
    CONSTRAINT phpbb_privmsgs_rules_rule_connection_check CHECK ((rule_connection >= 0)),
    CONSTRAINT phpbb_privmsgs_rules_rule_group_id_check CHECK ((rule_group_id >= 0)),
    CONSTRAINT phpbb_privmsgs_rules_rule_id_check CHECK ((rule_id >= 0)),
    CONSTRAINT phpbb_privmsgs_rules_rule_user_id_check CHECK ((rule_user_id >= 0)),
    CONSTRAINT phpbb_privmsgs_rules_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_privmsgs_rules OWNER TO "gus";

--
-- Name: phpbb_privmsgs_to; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_privmsgs_to (
    msg_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    pm_deleted smallint DEFAULT 0::smallint NOT NULL,
    pm_new smallint DEFAULT 1::smallint NOT NULL,
    pm_unread smallint DEFAULT 1::smallint NOT NULL,
    pm_replied smallint DEFAULT 0::smallint NOT NULL,
    pm_marked smallint DEFAULT 0::smallint NOT NULL,
    pm_forwarded smallint DEFAULT 0::smallint NOT NULL,
    folder_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_privmsgs_to_author_id_check CHECK ((author_id >= 0)),
    CONSTRAINT phpbb_privmsgs_to_msg_id_check CHECK ((msg_id >= 0)),
    CONSTRAINT phpbb_privmsgs_to_pm_deleted_check CHECK ((pm_deleted >= 0)),
    CONSTRAINT phpbb_privmsgs_to_pm_forwarded_check CHECK ((pm_forwarded >= 0)),
    CONSTRAINT phpbb_privmsgs_to_pm_marked_check CHECK ((pm_marked >= 0)),
    CONSTRAINT phpbb_privmsgs_to_pm_new_check CHECK ((pm_new >= 0)),
    CONSTRAINT phpbb_privmsgs_to_pm_replied_check CHECK ((pm_replied >= 0)),
    CONSTRAINT phpbb_privmsgs_to_pm_unread_check CHECK ((pm_unread >= 0)),
    CONSTRAINT phpbb_privmsgs_to_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_privmsgs_to OWNER TO "gus";

--
-- Name: phpbb_profile_fields_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_profile_fields_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_profile_fields_seq OWNER TO "gus";

--
-- Name: phpbb_profile_fields; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_profile_fields (
    field_id integer DEFAULT nextval('phpbb_profile_fields_seq'::regclass) NOT NULL,
    field_name character varying(255) DEFAULT ''::character varying NOT NULL,
    field_type character varying(100) DEFAULT ''::character varying NOT NULL,
    field_ident character varying(20) DEFAULT ''::character varying NOT NULL,
    field_length character varying(20) DEFAULT ''::character varying NOT NULL,
    field_minlen character varying(255) DEFAULT ''::character varying NOT NULL,
    field_maxlen character varying(255) DEFAULT ''::character varying NOT NULL,
    field_novalue character varying(255) DEFAULT ''::character varying NOT NULL,
    field_default_value character varying(255) DEFAULT ''::character varying NOT NULL,
    field_validation character varying(64) DEFAULT ''::character varying NOT NULL,
    field_required smallint DEFAULT 0::smallint NOT NULL,
    field_show_on_reg smallint DEFAULT 0::smallint NOT NULL,
    field_hide smallint DEFAULT 0::smallint NOT NULL,
    field_no_view smallint DEFAULT 0::smallint NOT NULL,
    field_active smallint DEFAULT 0::smallint NOT NULL,
    field_order integer DEFAULT 0 NOT NULL,
    field_show_profile smallint DEFAULT 0::smallint NOT NULL,
    field_show_on_vt smallint DEFAULT 0::smallint NOT NULL,
    field_show_novalue smallint DEFAULT 0::smallint NOT NULL,
    field_show_on_pm smallint DEFAULT 0::smallint NOT NULL,
    field_show_on_ml smallint DEFAULT 0::smallint NOT NULL,
    field_is_contact smallint DEFAULT 0::smallint NOT NULL,
    field_contact_desc character varying(255) DEFAULT ''::character varying NOT NULL,
    field_contact_url character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_profile_fields_field_active_check CHECK ((field_active >= 0)),
    CONSTRAINT phpbb_profile_fields_field_hide_check CHECK ((field_hide >= 0)),
    CONSTRAINT phpbb_profile_fields_field_id_check CHECK ((field_id >= 0)),
    CONSTRAINT phpbb_profile_fields_field_is_contact_check CHECK ((field_is_contact >= 0)),
    CONSTRAINT phpbb_profile_fields_field_no_view_check CHECK ((field_no_view >= 0)),
    CONSTRAINT phpbb_profile_fields_field_order_check CHECK ((field_order >= 0)),
    CONSTRAINT phpbb_profile_fields_field_required_check CHECK ((field_required >= 0)),
    CONSTRAINT phpbb_profile_fields_field_show_novalue_check CHECK ((field_show_novalue >= 0)),
    CONSTRAINT phpbb_profile_fields_field_show_on_ml_check CHECK ((field_show_on_ml >= 0)),
    CONSTRAINT phpbb_profile_fields_field_show_on_pm_check CHECK ((field_show_on_pm >= 0)),
    CONSTRAINT phpbb_profile_fields_field_show_on_reg_check CHECK ((field_show_on_reg >= 0)),
    CONSTRAINT phpbb_profile_fields_field_show_on_vt_check CHECK ((field_show_on_vt >= 0)),
    CONSTRAINT phpbb_profile_fields_field_show_profile_check CHECK ((field_show_profile >= 0))
);


ALTER TABLE phpbb_profile_fields OWNER TO "gus";

--
-- Name: phpbb_profile_fields_data; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_profile_fields_data (
    user_id integer DEFAULT 0 NOT NULL,
    pf_phpbb_interests text DEFAULT ''::text NOT NULL,
    pf_phpbb_occupation text DEFAULT ''::text NOT NULL,
    pf_phpbb_location character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_googleplus character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_twitter character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_youtube character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_icq character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_skype character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_facebook character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_website character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_wlm character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_yahoo character varying(255) DEFAULT ''::character varying NOT NULL,
    pf_phpbb_aol character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_profile_fields_data_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_profile_fields_data OWNER TO "gus";

--
-- Name: phpbb_profile_fields_lang; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_profile_fields_lang (
    field_id integer DEFAULT 0 NOT NULL,
    lang_id integer DEFAULT 0 NOT NULL,
    option_id integer DEFAULT 0 NOT NULL,
    field_type character varying(100) DEFAULT ''::character varying NOT NULL,
    lang_value character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_profile_fields_lang_field_id_check CHECK ((field_id >= 0)),
    CONSTRAINT phpbb_profile_fields_lang_lang_id_check CHECK ((lang_id >= 0)),
    CONSTRAINT phpbb_profile_fields_lang_option_id_check CHECK ((option_id >= 0))
);


ALTER TABLE phpbb_profile_fields_lang OWNER TO "gus";

--
-- Name: phpbb_profile_lang; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_profile_lang (
    field_id integer DEFAULT 0 NOT NULL,
    lang_id integer DEFAULT 0 NOT NULL,
    lang_name character varying(255) DEFAULT ''::character varying NOT NULL,
    lang_explain character varying(4000) DEFAULT ''::character varying NOT NULL,
    lang_default_value character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_profile_lang_field_id_check CHECK ((field_id >= 0)),
    CONSTRAINT phpbb_profile_lang_lang_id_check CHECK ((lang_id >= 0))
);


ALTER TABLE phpbb_profile_lang OWNER TO "gus";

--
-- Name: phpbb_ranks_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_ranks_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_ranks_seq OWNER TO "gus";

--
-- Name: phpbb_ranks; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_ranks (
    rank_id integer DEFAULT nextval('phpbb_ranks_seq'::regclass) NOT NULL,
    rank_title character varying(255) DEFAULT ''::character varying NOT NULL,
    rank_min integer DEFAULT 0 NOT NULL,
    rank_special smallint DEFAULT 0::smallint NOT NULL,
    rank_image character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_ranks_rank_id_check CHECK ((rank_id >= 0)),
    CONSTRAINT phpbb_ranks_rank_min_check CHECK ((rank_min >= 0)),
    CONSTRAINT phpbb_ranks_rank_special_check CHECK ((rank_special >= 0))
);


ALTER TABLE phpbb_ranks OWNER TO "gus";

--
-- Name: phpbb_reports_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_reports_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_reports_seq OWNER TO "gus";

--
-- Name: phpbb_reports; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_reports (
    report_id integer DEFAULT nextval('phpbb_reports_seq'::regclass) NOT NULL,
    reason_id smallint DEFAULT 0::smallint NOT NULL,
    post_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    user_notify smallint DEFAULT 0::smallint NOT NULL,
    report_closed smallint DEFAULT 0::smallint NOT NULL,
    report_time integer DEFAULT 0 NOT NULL,
    report_text text DEFAULT ''::text NOT NULL,
    pm_id integer DEFAULT 0 NOT NULL,
    reported_post_enable_bbcode smallint DEFAULT 1::smallint NOT NULL,
    reported_post_enable_smilies smallint DEFAULT 1::smallint NOT NULL,
    reported_post_enable_magic_url smallint DEFAULT 1::smallint NOT NULL,
    reported_post_text text DEFAULT ''::text NOT NULL,
    reported_post_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    reported_post_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_reports_pm_id_check CHECK ((pm_id >= 0)),
    CONSTRAINT phpbb_reports_post_id_check CHECK ((post_id >= 0)),
    CONSTRAINT phpbb_reports_reason_id_check CHECK ((reason_id >= 0)),
    CONSTRAINT phpbb_reports_report_closed_check CHECK ((report_closed >= 0)),
    CONSTRAINT phpbb_reports_report_id_check CHECK ((report_id >= 0)),
    CONSTRAINT phpbb_reports_report_time_check CHECK ((report_time >= 0)),
    CONSTRAINT phpbb_reports_reported_post_enable_bbcode_check CHECK ((reported_post_enable_bbcode >= 0)),
    CONSTRAINT phpbb_reports_reported_post_enable_magic_url_check CHECK ((reported_post_enable_magic_url >= 0)),
    CONSTRAINT phpbb_reports_reported_post_enable_smilies_check CHECK ((reported_post_enable_smilies >= 0)),
    CONSTRAINT phpbb_reports_user_id_check CHECK ((user_id >= 0)),
    CONSTRAINT phpbb_reports_user_notify_check CHECK ((user_notify >= 0))
);


ALTER TABLE phpbb_reports OWNER TO "gus";

--
-- Name: phpbb_reports_reasons_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_reports_reasons_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_reports_reasons_seq OWNER TO "gus";

--
-- Name: phpbb_reports_reasons; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_reports_reasons (
    reason_id smallint DEFAULT nextval('phpbb_reports_reasons_seq'::regclass) NOT NULL,
    reason_title character varying(255) DEFAULT ''::character varying NOT NULL,
    reason_description text DEFAULT ''::text NOT NULL,
    reason_order smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_reports_reasons_reason_id_check CHECK ((reason_id >= 0)),
    CONSTRAINT phpbb_reports_reasons_reason_order_check CHECK ((reason_order >= 0))
);


ALTER TABLE phpbb_reports_reasons OWNER TO "gus";

--
-- Name: phpbb_search_results; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_search_results (
    search_key character varying(32) DEFAULT ''::character varying NOT NULL,
    search_time integer DEFAULT 0 NOT NULL,
    search_keywords text DEFAULT ''::text NOT NULL,
    search_authors text DEFAULT ''::text NOT NULL,
    CONSTRAINT phpbb_search_results_search_time_check CHECK ((search_time >= 0))
);


ALTER TABLE phpbb_search_results OWNER TO "gus";

--
-- Name: phpbb_search_wordlist_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_search_wordlist_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_search_wordlist_seq OWNER TO "gus";

--
-- Name: phpbb_search_wordlist; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_search_wordlist (
    word_id integer DEFAULT nextval('phpbb_search_wordlist_seq'::regclass) NOT NULL,
    word_text character varying(255) DEFAULT ''::character varying NOT NULL,
    word_common smallint DEFAULT 0::smallint NOT NULL,
    word_count integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_search_wordlist_word_common_check CHECK ((word_common >= 0)),
    CONSTRAINT phpbb_search_wordlist_word_count_check CHECK ((word_count >= 0)),
    CONSTRAINT phpbb_search_wordlist_word_id_check CHECK ((word_id >= 0))
);


ALTER TABLE phpbb_search_wordlist OWNER TO "gus";

--
-- Name: phpbb_search_wordmatch; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_search_wordmatch (
    post_id integer DEFAULT 0 NOT NULL,
    word_id integer DEFAULT 0 NOT NULL,
    title_match smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_search_wordmatch_post_id_check CHECK ((post_id >= 0)),
    CONSTRAINT phpbb_search_wordmatch_title_match_check CHECK ((title_match >= 0)),
    CONSTRAINT phpbb_search_wordmatch_word_id_check CHECK ((word_id >= 0))
);


ALTER TABLE phpbb_search_wordmatch OWNER TO "gus";

--
-- Name: phpbb_sessions; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_sessions (
    session_id character(32) DEFAULT ''::bpchar NOT NULL,
    session_user_id integer DEFAULT 0 NOT NULL,
    session_last_visit integer DEFAULT 0 NOT NULL,
    session_start integer DEFAULT 0 NOT NULL,
    session_time integer DEFAULT 0 NOT NULL,
    session_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    session_browser character varying(150) DEFAULT ''::character varying NOT NULL,
    session_forwarded_for character varying(255) DEFAULT ''::character varying NOT NULL,
    session_page character varying(255) DEFAULT ''::character varying NOT NULL,
    session_viewonline smallint DEFAULT 1::smallint NOT NULL,
    session_autologin smallint DEFAULT 0::smallint NOT NULL,
    session_admin smallint DEFAULT 0::smallint NOT NULL,
    session_forum_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_sessions_session_admin_check CHECK ((session_admin >= 0)),
    CONSTRAINT phpbb_sessions_session_autologin_check CHECK ((session_autologin >= 0)),
    CONSTRAINT phpbb_sessions_session_forum_id_check CHECK ((session_forum_id >= 0)),
    CONSTRAINT phpbb_sessions_session_last_visit_check CHECK ((session_last_visit >= 0)),
    CONSTRAINT phpbb_sessions_session_start_check CHECK ((session_start >= 0)),
    CONSTRAINT phpbb_sessions_session_time_check CHECK ((session_time >= 0)),
    CONSTRAINT phpbb_sessions_session_user_id_check CHECK ((session_user_id >= 0)),
    CONSTRAINT phpbb_sessions_session_viewonline_check CHECK ((session_viewonline >= 0))
);


ALTER TABLE phpbb_sessions OWNER TO "gus";

--
-- Name: phpbb_sessions_keys; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_sessions_keys (
    key_id character(32) DEFAULT ''::bpchar NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    last_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    last_login integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_sessions_keys_last_login_check CHECK ((last_login >= 0)),
    CONSTRAINT phpbb_sessions_keys_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_sessions_keys OWNER TO "gus";

--
-- Name: phpbb_sitelist_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_sitelist_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_sitelist_seq OWNER TO "gus";

--
-- Name: phpbb_sitelist; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_sitelist (
    site_id integer DEFAULT nextval('phpbb_sitelist_seq'::regclass) NOT NULL,
    site_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    site_hostname character varying(255) DEFAULT ''::character varying NOT NULL,
    ip_exclude smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_sitelist_ip_exclude_check CHECK ((ip_exclude >= 0)),
    CONSTRAINT phpbb_sitelist_site_id_check CHECK ((site_id >= 0))
);


ALTER TABLE phpbb_sitelist OWNER TO "gus";

--
-- Name: phpbb_smilies_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_smilies_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_smilies_seq OWNER TO "gus";

--
-- Name: phpbb_smilies; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_smilies (
    smiley_id integer DEFAULT nextval('phpbb_smilies_seq'::regclass) NOT NULL,
    code character varying(50) DEFAULT ''::character varying NOT NULL,
    emotion character varying(50) DEFAULT ''::character varying NOT NULL,
    smiley_url character varying(50) DEFAULT ''::character varying NOT NULL,
    smiley_width smallint DEFAULT 0::smallint NOT NULL,
    smiley_height smallint DEFAULT 0::smallint NOT NULL,
    smiley_order integer DEFAULT 0 NOT NULL,
    display_on_posting smallint DEFAULT 1::smallint NOT NULL,
    CONSTRAINT phpbb_smilies_display_on_posting_check CHECK ((display_on_posting >= 0)),
    CONSTRAINT phpbb_smilies_smiley_height_check CHECK ((smiley_height >= 0)),
    CONSTRAINT phpbb_smilies_smiley_id_check CHECK ((smiley_id >= 0)),
    CONSTRAINT phpbb_smilies_smiley_order_check CHECK ((smiley_order >= 0)),
    CONSTRAINT phpbb_smilies_smiley_width_check CHECK ((smiley_width >= 0))
);


ALTER TABLE phpbb_smilies OWNER TO "gus";

--
-- Name: phpbb_styles_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_styles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_styles_seq OWNER TO "gus";

--
-- Name: phpbb_styles; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_styles (
    style_id integer DEFAULT nextval('phpbb_styles_seq'::regclass) NOT NULL,
    style_name character varying(255) DEFAULT ''::character varying NOT NULL,
    style_copyright character varying(255) DEFAULT ''::character varying NOT NULL,
    style_active smallint DEFAULT 1::smallint NOT NULL,
    style_path character varying(100) DEFAULT ''::character varying NOT NULL,
    bbcode_bitfield character varying(255) DEFAULT 'kNg='::character varying NOT NULL,
    style_parent_id integer DEFAULT 0 NOT NULL,
    style_parent_tree character varying(8000) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_styles_style_active_check CHECK ((style_active >= 0)),
    CONSTRAINT phpbb_styles_style_id_check CHECK ((style_id >= 0)),
    CONSTRAINT phpbb_styles_style_parent_id_check CHECK ((style_parent_id >= 0))
);


ALTER TABLE phpbb_styles OWNER TO "gus";

--
-- Name: phpbb_teampage_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_teampage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_teampage_seq OWNER TO "gus";

--
-- Name: phpbb_teampage; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_teampage (
    teampage_id integer DEFAULT nextval('phpbb_teampage_seq'::regclass) NOT NULL,
    group_id integer DEFAULT 0 NOT NULL,
    teampage_name character varying(255) DEFAULT ''::character varying NOT NULL,
    teampage_position integer DEFAULT 0 NOT NULL,
    teampage_parent integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_teampage_group_id_check CHECK ((group_id >= 0)),
    CONSTRAINT phpbb_teampage_teampage_id_check CHECK ((teampage_id >= 0)),
    CONSTRAINT phpbb_teampage_teampage_parent_check CHECK ((teampage_parent >= 0)),
    CONSTRAINT phpbb_teampage_teampage_position_check CHECK ((teampage_position >= 0))
);


ALTER TABLE phpbb_teampage OWNER TO "gus";

--
-- Name: phpbb_topics_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_topics_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_topics_seq OWNER TO "gus";

--
-- Name: phpbb_topics; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_topics (
    topic_id integer DEFAULT nextval('phpbb_topics_seq'::regclass) NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    icon_id integer DEFAULT 0 NOT NULL,
    topic_attachment smallint DEFAULT 0::smallint NOT NULL,
    topic_reported smallint DEFAULT 0::smallint NOT NULL,
    topic_title character varying(255) DEFAULT ''::character varying NOT NULL,
    topic_poster integer DEFAULT 0 NOT NULL,
    topic_time integer DEFAULT 0 NOT NULL,
    topic_time_limit integer DEFAULT 0 NOT NULL,
    topic_views integer DEFAULT 0 NOT NULL,
    topic_status smallint DEFAULT 0::smallint NOT NULL,
    topic_type smallint DEFAULT 0::smallint NOT NULL,
    topic_first_post_id integer DEFAULT 0 NOT NULL,
    topic_first_poster_name character varying(255) DEFAULT ''::character varying NOT NULL,
    topic_first_poster_colour character varying(6) DEFAULT ''::character varying NOT NULL,
    topic_last_post_id integer DEFAULT 0 NOT NULL,
    topic_last_poster_id integer DEFAULT 0 NOT NULL,
    topic_last_poster_name character varying(255) DEFAULT ''::character varying NOT NULL,
    topic_last_poster_colour character varying(6) DEFAULT ''::character varying NOT NULL,
    topic_last_post_subject character varying(255) DEFAULT ''::character varying NOT NULL,
    topic_last_post_time integer DEFAULT 0 NOT NULL,
    topic_last_view_time integer DEFAULT 0 NOT NULL,
    topic_moved_id integer DEFAULT 0 NOT NULL,
    topic_bumped smallint DEFAULT 0::smallint NOT NULL,
    topic_bumper integer DEFAULT 0 NOT NULL,
    poll_title character varying(255) DEFAULT ''::character varying NOT NULL,
    poll_start integer DEFAULT 0 NOT NULL,
    poll_length integer DEFAULT 0 NOT NULL,
    poll_max_options smallint DEFAULT 1::smallint NOT NULL,
    poll_last_vote integer DEFAULT 0 NOT NULL,
    poll_vote_change smallint DEFAULT 0::smallint NOT NULL,
    topic_visibility smallint DEFAULT 0::smallint NOT NULL,
    topic_delete_time integer DEFAULT 0 NOT NULL,
    topic_delete_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    topic_delete_user integer DEFAULT 0 NOT NULL,
    topic_posts_approved integer DEFAULT 0 NOT NULL,
    topic_posts_unapproved integer DEFAULT 0 NOT NULL,
    topic_posts_softdeleted integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_topics_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_topics_icon_id_check CHECK ((icon_id >= 0)),
    CONSTRAINT phpbb_topics_poll_last_vote_check CHECK ((poll_last_vote >= 0)),
    CONSTRAINT phpbb_topics_poll_length_check CHECK ((poll_length >= 0)),
    CONSTRAINT phpbb_topics_poll_start_check CHECK ((poll_start >= 0)),
    CONSTRAINT phpbb_topics_poll_vote_change_check CHECK ((poll_vote_change >= 0)),
    CONSTRAINT phpbb_topics_topic_attachment_check CHECK ((topic_attachment >= 0)),
    CONSTRAINT phpbb_topics_topic_bumped_check CHECK ((topic_bumped >= 0)),
    CONSTRAINT phpbb_topics_topic_bumper_check CHECK ((topic_bumper >= 0)),
    CONSTRAINT phpbb_topics_topic_delete_time_check CHECK ((topic_delete_time >= 0)),
    CONSTRAINT phpbb_topics_topic_delete_user_check CHECK ((topic_delete_user >= 0)),
    CONSTRAINT phpbb_topics_topic_first_post_id_check CHECK ((topic_first_post_id >= 0)),
    CONSTRAINT phpbb_topics_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_topics_topic_last_post_id_check CHECK ((topic_last_post_id >= 0)),
    CONSTRAINT phpbb_topics_topic_last_post_time_check CHECK ((topic_last_post_time >= 0)),
    CONSTRAINT phpbb_topics_topic_last_poster_id_check CHECK ((topic_last_poster_id >= 0)),
    CONSTRAINT phpbb_topics_topic_last_view_time_check CHECK ((topic_last_view_time >= 0)),
    CONSTRAINT phpbb_topics_topic_moved_id_check CHECK ((topic_moved_id >= 0)),
    CONSTRAINT phpbb_topics_topic_poster_check CHECK ((topic_poster >= 0)),
    CONSTRAINT phpbb_topics_topic_posts_approved_check CHECK ((topic_posts_approved >= 0)),
    CONSTRAINT phpbb_topics_topic_posts_softdeleted_check CHECK ((topic_posts_softdeleted >= 0)),
    CONSTRAINT phpbb_topics_topic_posts_unapproved_check CHECK ((topic_posts_unapproved >= 0)),
    CONSTRAINT phpbb_topics_topic_reported_check CHECK ((topic_reported >= 0)),
    CONSTRAINT phpbb_topics_topic_time_check CHECK ((topic_time >= 0)),
    CONSTRAINT phpbb_topics_topic_time_limit_check CHECK ((topic_time_limit >= 0)),
    CONSTRAINT phpbb_topics_topic_views_check CHECK ((topic_views >= 0))
);


ALTER TABLE phpbb_topics OWNER TO "gus";

--
-- Name: phpbb_topics_posted; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_topics_posted (
    user_id integer DEFAULT 0 NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    topic_posted smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_topics_posted_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_topics_posted_topic_posted_check CHECK ((topic_posted >= 0)),
    CONSTRAINT phpbb_topics_posted_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_topics_posted OWNER TO "gus";

--
-- Name: phpbb_topics_track; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_topics_track (
    user_id integer DEFAULT 0 NOT NULL,
    topic_id integer DEFAULT 0 NOT NULL,
    forum_id integer DEFAULT 0 NOT NULL,
    mark_time integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_topics_track_forum_id_check CHECK ((forum_id >= 0)),
    CONSTRAINT phpbb_topics_track_mark_time_check CHECK ((mark_time >= 0)),
    CONSTRAINT phpbb_topics_track_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_topics_track_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_topics_track OWNER TO "gus";

--
-- Name: phpbb_topics_watch; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_topics_watch (
    topic_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notify_status smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_topics_watch_notify_status_check CHECK ((notify_status >= 0)),
    CONSTRAINT phpbb_topics_watch_topic_id_check CHECK ((topic_id >= 0)),
    CONSTRAINT phpbb_topics_watch_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_topics_watch OWNER TO "gus";

--
-- Name: phpbb_user_group; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_user_group (
    group_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    group_leader smallint DEFAULT 0::smallint NOT NULL,
    user_pending smallint DEFAULT 1::smallint NOT NULL,
    CONSTRAINT phpbb_user_group_group_id_check CHECK ((group_id >= 0)),
    CONSTRAINT phpbb_user_group_group_leader_check CHECK ((group_leader >= 0)),
    CONSTRAINT phpbb_user_group_user_id_check CHECK ((user_id >= 0)),
    CONSTRAINT phpbb_user_group_user_pending_check CHECK ((user_pending >= 0))
);


ALTER TABLE phpbb_user_group OWNER TO "gus";

--
-- Name: phpbb_user_notifications; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_user_notifications (
    item_type character varying(255) DEFAULT ''::character varying NOT NULL,
    item_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    method character varying(255) DEFAULT ''::character varying NOT NULL,
    notify smallint DEFAULT 1::smallint NOT NULL,
    CONSTRAINT phpbb_user_notifications_item_id_check CHECK ((item_id >= 0)),
    CONSTRAINT phpbb_user_notifications_notify_check CHECK ((notify >= 0)),
    CONSTRAINT phpbb_user_notifications_user_id_check CHECK ((user_id >= 0))
);


ALTER TABLE phpbb_user_notifications OWNER TO "gus";

--
-- Name: phpbb_users_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_users_seq OWNER TO "gus";

--
-- Name: phpbb_users; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_users (
    user_id integer DEFAULT nextval('phpbb_users_seq'::regclass) NOT NULL,
    user_type smallint DEFAULT 0::smallint NOT NULL,
    group_id integer DEFAULT 3 NOT NULL,
    user_permissions text DEFAULT ''::text NOT NULL,
    user_perm_from integer DEFAULT 0 NOT NULL,
    user_ip character varying(40) DEFAULT ''::character varying NOT NULL,
    user_regdate integer DEFAULT 0 NOT NULL,
    username varchar_ci DEFAULT ''::character varying NOT NULL,
    username_clean varchar_ci DEFAULT ''::character varying NOT NULL,
    user_password character varying(255) DEFAULT ''::character varying NOT NULL,
    user_passchg integer DEFAULT 0 NOT NULL,
    user_email character varying(100) DEFAULT ''::character varying NOT NULL,
    user_email_hash bigint DEFAULT 0::bigint NOT NULL,
    user_birthday character varying(10) DEFAULT ''::character varying NOT NULL,
    user_lastvisit integer DEFAULT 0 NOT NULL,
    user_lastmark integer DEFAULT 0 NOT NULL,
    user_lastpost_time integer DEFAULT 0 NOT NULL,
    user_lastpage character varying(200) DEFAULT ''::character varying NOT NULL,
    user_last_confirm_key character varying(10) DEFAULT ''::character varying NOT NULL,
    user_last_search integer DEFAULT 0 NOT NULL,
    user_warnings smallint DEFAULT 0::smallint NOT NULL,
    user_last_warning integer DEFAULT 0 NOT NULL,
    user_login_attempts smallint DEFAULT 0::smallint NOT NULL,
    user_inactive_reason smallint DEFAULT 0::smallint NOT NULL,
    user_inactive_time integer DEFAULT 0 NOT NULL,
    user_posts integer DEFAULT 0 NOT NULL,
    user_lang character varying(30) DEFAULT ''::character varying NOT NULL,
    user_timezone character varying(100) DEFAULT ''::character varying NOT NULL,
    user_dateformat character varying(64) DEFAULT 'd M Y H:i'::character varying NOT NULL,
    user_style integer DEFAULT 0 NOT NULL,
    user_rank integer DEFAULT 0 NOT NULL,
    user_colour character varying(6) DEFAULT ''::character varying NOT NULL,
    user_new_privmsg integer DEFAULT 0 NOT NULL,
    user_unread_privmsg integer DEFAULT 0 NOT NULL,
    user_last_privmsg integer DEFAULT 0 NOT NULL,
    user_message_rules smallint DEFAULT 0::smallint NOT NULL,
    user_full_folder integer DEFAULT (-3) NOT NULL,
    user_emailtime integer DEFAULT 0 NOT NULL,
    user_topic_show_days smallint DEFAULT 0::smallint NOT NULL,
    user_topic_sortby_type character varying(1) DEFAULT 't'::character varying NOT NULL,
    user_topic_sortby_dir character varying(1) DEFAULT 'd'::character varying NOT NULL,
    user_post_show_days smallint DEFAULT 0::smallint NOT NULL,
    user_post_sortby_type character varying(1) DEFAULT 't'::character varying NOT NULL,
    user_post_sortby_dir character varying(1) DEFAULT 'a'::character varying NOT NULL,
    user_notify smallint DEFAULT 0::smallint NOT NULL,
    user_notify_pm smallint DEFAULT 1::smallint NOT NULL,
    user_notify_type smallint DEFAULT 0::smallint NOT NULL,
    user_allow_pm smallint DEFAULT 1::smallint NOT NULL,
    user_allow_viewonline smallint DEFAULT 1::smallint NOT NULL,
    user_allow_viewemail smallint DEFAULT 1::smallint NOT NULL,
    user_allow_massemail smallint DEFAULT 1::smallint NOT NULL,
    user_options integer DEFAULT 230271 NOT NULL,
    user_avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    user_avatar_type character varying(255) DEFAULT ''::character varying NOT NULL,
    user_avatar_width smallint DEFAULT 0::smallint NOT NULL,
    user_avatar_height smallint DEFAULT 0::smallint NOT NULL,
    user_sig text DEFAULT ''::text NOT NULL,
    user_sig_bbcode_uid character varying(8) DEFAULT ''::character varying NOT NULL,
    user_sig_bbcode_bitfield character varying(255) DEFAULT ''::character varying NOT NULL,
    user_jabber character varying(255) DEFAULT ''::character varying NOT NULL,
    user_actkey character varying(32) DEFAULT ''::character varying NOT NULL,
    user_newpasswd character varying(255) DEFAULT ''::character varying NOT NULL,
    user_form_salt character varying(32) DEFAULT ''::character varying NOT NULL,
    user_new smallint DEFAULT 1::smallint NOT NULL,
    user_reminded smallint DEFAULT 0::smallint NOT NULL,
    user_reminded_time integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_users_group_id_check CHECK ((group_id >= 0)),
    CONSTRAINT phpbb_users_user_allow_massemail_check CHECK ((user_allow_massemail >= 0)),
    CONSTRAINT phpbb_users_user_allow_pm_check CHECK ((user_allow_pm >= 0)),
    CONSTRAINT phpbb_users_user_allow_viewemail_check CHECK ((user_allow_viewemail >= 0)),
    CONSTRAINT phpbb_users_user_allow_viewonline_check CHECK ((user_allow_viewonline >= 0)),
    CONSTRAINT phpbb_users_user_avatar_height_check CHECK ((user_avatar_height >= 0)),
    CONSTRAINT phpbb_users_user_avatar_width_check CHECK ((user_avatar_width >= 0)),
    CONSTRAINT phpbb_users_user_emailtime_check CHECK ((user_emailtime >= 0)),
    CONSTRAINT phpbb_users_user_id_check CHECK ((user_id >= 0)),
    CONSTRAINT phpbb_users_user_inactive_time_check CHECK ((user_inactive_time >= 0)),
    CONSTRAINT phpbb_users_user_last_privmsg_check CHECK ((user_last_privmsg >= 0)),
    CONSTRAINT phpbb_users_user_last_search_check CHECK ((user_last_search >= 0)),
    CONSTRAINT phpbb_users_user_last_warning_check CHECK ((user_last_warning >= 0)),
    CONSTRAINT phpbb_users_user_lastmark_check CHECK ((user_lastmark >= 0)),
    CONSTRAINT phpbb_users_user_lastpost_time_check CHECK ((user_lastpost_time >= 0)),
    CONSTRAINT phpbb_users_user_lastvisit_check CHECK ((user_lastvisit >= 0)),
    CONSTRAINT phpbb_users_user_message_rules_check CHECK ((user_message_rules >= 0)),
    CONSTRAINT phpbb_users_user_new_check CHECK ((user_new >= 0)),
    CONSTRAINT phpbb_users_user_notify_check CHECK ((user_notify >= 0)),
    CONSTRAINT phpbb_users_user_notify_pm_check CHECK ((user_notify_pm >= 0)),
    CONSTRAINT phpbb_users_user_options_check CHECK ((user_options >= 0)),
    CONSTRAINT phpbb_users_user_passchg_check CHECK ((user_passchg >= 0)),
    CONSTRAINT phpbb_users_user_perm_from_check CHECK ((user_perm_from >= 0)),
    CONSTRAINT phpbb_users_user_post_show_days_check CHECK ((user_post_show_days >= 0)),
    CONSTRAINT phpbb_users_user_posts_check CHECK ((user_posts >= 0)),
    CONSTRAINT phpbb_users_user_rank_check CHECK ((user_rank >= 0)),
    CONSTRAINT phpbb_users_user_regdate_check CHECK ((user_regdate >= 0)),
    CONSTRAINT phpbb_users_user_reminded_time_check CHECK ((user_reminded_time >= 0)),
    CONSTRAINT phpbb_users_user_style_check CHECK ((user_style >= 0)),
    CONSTRAINT phpbb_users_user_topic_show_days_check CHECK ((user_topic_show_days >= 0))
);


ALTER TABLE phpbb_users OWNER TO "gus";

--
-- Name: phpbb_warnings_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_warnings_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_warnings_seq OWNER TO "gus";

--
-- Name: phpbb_warnings; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_warnings (
    warning_id integer DEFAULT nextval('phpbb_warnings_seq'::regclass) NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    post_id integer DEFAULT 0 NOT NULL,
    log_id integer DEFAULT 0 NOT NULL,
    warning_time integer DEFAULT 0 NOT NULL,
    CONSTRAINT phpbb_warnings_log_id_check CHECK ((log_id >= 0)),
    CONSTRAINT phpbb_warnings_post_id_check CHECK ((post_id >= 0)),
    CONSTRAINT phpbb_warnings_user_id_check CHECK ((user_id >= 0)),
    CONSTRAINT phpbb_warnings_warning_id_check CHECK ((warning_id >= 0)),
    CONSTRAINT phpbb_warnings_warning_time_check CHECK ((warning_time >= 0))
);


ALTER TABLE phpbb_warnings OWNER TO "gus";

--
-- Name: phpbb_words_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE phpbb_words_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phpbb_words_seq OWNER TO "gus";

--
-- Name: phpbb_words; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_words (
    word_id integer DEFAULT nextval('phpbb_words_seq'::regclass) NOT NULL,
    word character varying(255) DEFAULT ''::character varying NOT NULL,
    replacement character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT phpbb_words_word_id_check CHECK ((word_id >= 0))
);


ALTER TABLE phpbb_words OWNER TO "gus";

--
-- Name: phpbb_zebra; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE phpbb_zebra (
    user_id integer DEFAULT 0 NOT NULL,
    zebra_id integer DEFAULT 0 NOT NULL,
    friend smallint DEFAULT 0::smallint NOT NULL,
    foe smallint DEFAULT 0::smallint NOT NULL,
    CONSTRAINT phpbb_zebra_foe_check CHECK ((foe >= 0)),
    CONSTRAINT phpbb_zebra_friend_check CHECK ((friend >= 0)),
    CONSTRAINT phpbb_zebra_user_id_check CHECK ((user_id >= 0)),
    CONSTRAINT phpbb_zebra_zebra_id_check CHECK ((zebra_id >= 0))
);


ALTER TABLE phpbb_zebra OWNER TO "gus";

--
-- Name: player; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE player (
    id integer NOT NULL,
    clan_id integer,
    tag character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    date_creation timestamp(0) without time zone NOT NULL,
    date_maj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    old boolean NOT NULL,
    hdv integer NOT NULL,
    role character varying(255) NOT NULL,
    exp_level integer NOT NULL,
    war_stars integer NOT NULL
);


ALTER TABLE player OWNER TO "gus";

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE player_id_seq OWNER TO "gus";

--
-- Name: target; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE target (
    id integer NOT NULL,
    war_id integer,
    "position" integer NOT NULL,
    hdv integer,
    comment text,
    stars integer,
    date_creation timestamp(0) without time zone NOT NULL,
    date_maj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    image_id integer
);


ALTER TABLE target OWNER TO "gus";

--
-- Name: target_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE target_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE target_id_seq OWNER TO "gus";

--
-- Name: war; Type: TABLE; Schema: public; Owner: gus; Tablespace: 
--

CREATE TABLE war (
    id integer NOT NULL,
    bzh_clan_id integer,
    vs_clan_id integer,
    code character varying(6) NOT NULL,
    size integer NOT NULL,
    date_start timestamp(0) without time zone NOT NULL,
    date_end timestamp(0) without time zone NOT NULL,
    date_creation timestamp(0) without time zone NOT NULL,
    date_maj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    stars_bzh integer,
    stars_vs integer,
    destruction_bzh double precision,
    destruction_vs double precision,
    result character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE war OWNER TO "gus";

--
-- Name: war_id_seq; Type: SEQUENCE; Schema: public; Owner: gus
--

CREATE SEQUENCE war_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE war_id_seq OWNER TO "gus";

--
-- Data for Name: attack; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY attack (id, target_id, name, stars, date_creation, date_maj, destruction, timer_start, timer_end, date_result, first_star_win, second_star_win, third_star_win, hdv) FROM stdin;
40	259	ju	3	2016-11-11 09:57:24	\N	100	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 02:08:45	t	t	t	\N
30	249	...Diabolesse..	1	2016-11-11 09:56:08	\N	53	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 07:00:24	t	f	f	\N
28	247	cox7	1	2016-11-11 09:55:52	\N	53	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 07:00:48	t	f	f	\N
55	255	yoyo	2	2016-11-12 12:19:22	\N	64	2016-11-12 15:19:08	2016-11-12 18:19:08	2016-11-12 17:27:48	f	f	f	\N
64	255	neguess52	2	2016-11-12 15:23:48	\N	67	2016-11-12 15:23:49	2016-11-12 18:23:49	2016-11-12 17:28:03	f	f	f	\N
78	274	Ghibli	0	2016-11-13 09:31:47	\N	44	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 23:26:07	f	f	f	\N
65	255	jibe79	3	2016-11-12 17:22:41	\N	100	2016-11-12 17:22:41	2016-11-12 20:22:41	2016-11-12 17:28:07	f	f	t	\N
31	250	jibe79	1	2016-11-11 09:56:12	\N	64	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 09:07:52	t	f	f	\N
66	258	bidou	2	2016-11-12 17:27:19	\N	75	2016-11-12 17:27:19	2016-11-12 20:27:19	2016-11-12 17:33:28	f	f	f	\N
26	245	Ghibli	1	2016-11-11 09:55:42	\N	\N	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 09:42:55	t	f	f	\N
83	279	jibe79	1	2016-11-13 09:32:18	\N	51	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 23:53:14	t	f	f	\N
76	272	denez	2	2016-11-13 09:30:35	\N	70	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 00:13:32	t	t	f	\N
82	278	...Diabolesse..	2	2016-11-13 09:32:14	\N	98	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 00:39:08	t	t	f	\N
87	283	mikke	2	2016-11-13 09:32:54	\N	54	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 09:34:14	t	t	f	\N
86	282	neguess52	3	2016-11-13 09:32:40	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 09:34:25	t	t	t	\N
35	254	neguess52	3	2016-11-11 09:56:53	\N	100	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 10:47:28	t	t	t	\N
39	258	ninalys	3	2016-11-11 09:57:16	\N	100	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 17:33:51	t	t	t	\N
51	241	denez	2	2016-11-11 23:56:00	\N	55	2016-11-11 23:56:00	2016-11-12 02:56:00	2016-11-12 10:48:07	t	t	f	\N
24	243	rose écarlate	2	2016-11-11 09:55:28	\N	63	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 10:49:51	t	t	f	\N
27	246	simon	2	2016-11-11 09:55:47	\N	71	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 11:43:07	t	t	f	\N
25	244	JouGe.56	2	2016-11-11 09:55:32	\N	80	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-11 22:37:43	t	t	f	\N
32	251	tristan	2	2016-11-11 09:56:19	\N	65	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 12:12:33	t	t	f	\N
33	252	titouanjanis	3	2016-11-11 09:56:29	\N	100	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-11 22:49:23	t	t	t	\N
38	257	Gus	3	2016-11-11 09:57:08	\N	100	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-11 23:22:17	t	t	t	\N
23	242	denez	2	2016-11-11 09:55:24	\N	92	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-11 23:32:42	t	t	f	\N
29	248	King PHE	1	2016-11-11 09:55:57	\N	52	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 00:16:14	t	f	f	\N
37	256	mikke	2	2016-11-11 09:57:03	\N	52	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 00:17:07	t	t	f	\N
41	260	bidou	3	2016-11-11 09:57:37	\N	100	2016-11-11 22:02:29	2016-11-12 12:00:00	2016-11-12 18:27:08	t	t	t	\N
60	250	mikke	1	2016-11-12 14:57:13	\N	50	2016-11-12 14:57:13	2016-11-12 17:57:13	2016-11-12 14:57:44	f	f	f	\N
61	249	Ghibli	3	2016-11-12 15:01:31	\N	100	2016-11-12 15:01:31	2016-11-12 18:01:31	2016-11-12 15:19:49	f	t	t	\N
59	256	Gus	3	2016-11-12 14:56:49	\N	100	2016-11-12 14:56:49	2016-11-12 17:56:49	2016-11-12 16:18:20	f	f	t	\N
68	250	King PHE	3	2016-11-12 18:11:09	\N	100	2016-11-12 18:11:09	2016-11-12 21:11:09	2016-11-12 18:29:39	f	t	t	\N
54	255	racitinio	2	2016-11-12 12:19:08	\N	59	2016-11-12 12:19:08	2016-11-12 15:19:08	2016-11-12 17:27:27	t	t	f	\N
56	253	racitinio	2	2016-11-12 12:19:54	\N	56	2016-11-12 12:19:54	2016-11-12 15:19:54	2016-11-12 18:30:47	t	t	f	\N
62	253	titouanjanis	1	2016-11-12 15:10:20	\N	74	2016-11-12 15:10:20	2016-11-12 18:10:20	2016-11-12 18:31:02	f	f	f	\N
67	253	tristan	3	2016-11-12 17:40:10	\N	100	2016-11-12 17:40:10	2016-11-12 20:40:10	2016-11-12 18:50:55	f	f	t	\N
70	251	...Diabolesse..	2	2016-11-12 19:39:40	\N	67	2016-11-12 19:39:40	2016-11-12 22:39:40	2016-11-12 20:29:52	f	f	f	\N
74	247	JouGe.56	2	2016-11-12 20:39:14	\N	65	2016-11-12 20:39:15	2016-11-12 23:39:15	2016-11-12 20:52:56	f	t	f	\N
73	248	rose écarlate	2	2016-11-12 20:27:02	\N	70	2016-11-12 20:27:02	2016-11-12 23:27:02	2016-11-13 09:36:23	f	t	f	\N
93	289	tony25000	3	2016-11-13 09:33:43	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 22:00:53	t	t	t	\N
94	290	bidou	3	2016-11-13 09:33:50	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 22:20:07	t	t	t	\N
77	273	JouGe.56	2	2016-11-13 09:30:48	\N	61	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 22:57:14	t	t	f	\N
89	285	ninalys	3	2016-11-13 09:33:14	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 22:57:29	t	t	t	\N
92	288	Sonic Bibou	3	2016-11-13 09:33:37	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 22:59:42	t	t	t	\N
91	287	ju	3	2016-11-13 09:33:30	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 22:59:53	t	t	t	\N
90	286	Cthulhu	3	2016-11-13 09:33:22	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-13 23:00:14	t	t	t	\N
96	279	Ju	2	2016-11-14 10:30:48	\N	63	2016-11-14 10:30:48	2016-11-14 13:30:48	2016-11-14 10:31:08	f	t	f	\N
88	284	Gus	3	2016-11-13 09:33:06	\N	100	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 11:20:32	t	t	t	\N
80	276	simon	2	2016-11-13 09:31:58	\N	82	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 11:40:45	t	t	f	\N
84	280	tristan	2	2016-11-13 09:32:25	\N	82	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 13:03:33	t	t	f	\N
97	283	neguess52	2	2016-11-14 10:36:50	\N	90	2016-11-14 10:36:50	2016-11-14 13:36:50	2016-11-14 11:58:15	f	f	f	\N
79	275	Super VegeDave	2	2016-11-13 09:31:53	\N	82	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 12:46:28	t	t	f	\N
85	281	Marin	2	2016-11-13 09:32:31	\N	98	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 13:20:26	t	t	f	\N
99	271	denez	2	2016-11-14 12:01:46	\N	77	2016-11-14 12:01:46	2016-11-14 15:01:46	2016-11-14 13:33:57	t	t	f	\N
98	283	Gus	2	2016-11-14 11:47:18	\N	60	2016-11-14 13:36:50	2016-11-14 16:36:50	2016-11-14 13:53:30	f	f	f	\N
103	281	tristan	2	2016-11-14 13:20:06	\N	89	2016-11-14 15:00:00	2016-11-14 18:00:00	2016-11-14 13:58:53	t	t	f	\N
102	281	Ninalys	1	2016-11-14 12:52:41	\N	49	2016-11-14 12:00:00	2016-11-14 15:00:00	2016-11-14 13:59:19	f	f	f	\N
106	281	jibe79	3	2016-11-14 14:15:10	\N	100	2016-11-14 14:15:10	2016-11-14 17:15:10	2016-11-14 15:00:25	f	f	t	\N
81	277	King PHE	2	2016-11-13 09:32:05	\N	94	2016-11-13 21:54:12	2016-11-14 12:00:00	2016-11-14 15:01:22	t	t	f	\N
108	280	...Diabolesse..	2	2016-11-14 15:04:49	\N	80	2016-11-14 15:04:49	2016-11-14 18:04:49	2016-11-14 15:41:07	f	f	f	\N
125	280	King PHE	3	2016-11-14 17:25:31	\N	100	2016-11-14 17:25:31	2016-11-14 20:25:31	2016-11-14 18:07:43	f	f	t	\N
123	300	plop man	2	2016-11-14 15:12:55	\N	52	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-14 21:07:14	t	t	f	\N
116	293	Shermi	3	2016-11-14 15:11:38	\N	100	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-14 22:17:29	t	t	t	\N
117	294	Brooks	2	2016-11-14 15:11:48	\N	55	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-14 22:18:12	t	t	f	\N
121	298	sylvain	3	2016-11-14 15:12:29	\N	100	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-15 08:01:56	t	t	t	\N
107	283	marin	3	2016-11-14 14:30:54	\N	100	2016-11-14 14:30:54	2016-11-14 17:30:54	2016-11-15 10:08:15	f	f	t	\N
118	295	juleswarz	2	2016-11-14 15:11:59	\N	72	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-15 11:13:39	t	t	f	\N
124	300	xubakka	2	2016-11-14 15:13:05	\N	55	2016-11-15 12:00:00	2016-11-15 15:00:00	2016-11-15 16:52:48	f	f	f	\N
120	297	xubakka	2	2016-11-14 15:12:19	\N	81	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-15 15:46:55	t	t	f	\N
122	299	Chou	3	2016-11-14 15:12:41	\N	100	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-15 18:41:55	t	t	t	\N
128	290	tony25000	3	2016-11-14 18:26:58	\N	100	2016-11-14 18:26:58	2016-11-14 21:26:58	2016-11-14 19:28:26	f	f	f	\N
150	320	bidou	3	2016-11-15 10:42:30	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 23:14:33	t	t	t	\N
127	274	JouGe.56	2	2016-11-14 18:08:45	\N	68	2016-11-14 18:08:45	2016-11-14 21:08:45	2016-11-14 19:44:18	t	t	f	\N
119	296	yanice	1	2016-11-14 15:12:07	\N	50	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-15 08:01:45	t	f	f	\N
126	283	cthulhu	2	2016-11-14 17:29:40	\N	\N	2016-11-14 17:30:54	2016-11-14 20:30:54	2016-11-15 10:08:22	f	f	f	\N
129	279	Ghibli	1	2016-11-15 10:09:34	\N	82	2016-11-15 10:09:34	2016-11-15 13:09:34	2016-11-15 10:09:47	f	f	f	\N
130	279	Super VegeDave	2	2016-11-15 10:10:03	\N	90	2016-11-15 10:10:03	2016-11-15 13:10:03	2016-11-15 10:10:18	f	f	f	\N
131	278	simon	2	2016-11-15 10:10:40	\N	84	2016-11-15 10:10:41	2016-11-15 13:10:41	2016-11-15 10:10:51	f	f	f	\N
151	296	juleswarz	2	2016-11-15 12:12:11	\N	51	2016-11-15 12:12:12	2016-11-15 15:12:12	2016-11-15 12:40:50	f	t	f	\N
115	292	titouanjanis	2	2016-11-14 15:11:28	\N	56	2016-11-14 20:25:51	2016-11-15 12:00:00	2016-11-15 16:51:14	t	t	f	\N
153	291	titouanjanis	2	2016-11-15 16:51:55	\N	70	2016-11-15 16:51:55	2016-11-15 19:51:55	2016-11-15 16:52:05	t	t	f	\N
152	297	Yanice	3	2016-11-15 15:47:13	\N	100	2016-11-15 15:47:13	2016-11-15 18:47:13	2016-11-15 17:36:16	f	f	t	\N
138	308	Gil2 latourette	3	2016-11-15 10:41:16	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 23:27:48	t	t	t	\N
154	300	Chou	3	2016-11-15 18:40:49	\N	100	2016-11-15 18:40:49	2016-11-15 21:40:49	2016-11-15 18:41:04	f	f	t	\N
155	296	sylvain	2	2016-11-15 18:42:35	\N	77	2016-11-15 18:42:35	2016-11-15 21:42:35	2016-11-15 18:42:45	f	f	f	\N
133	303	JouGe.56	3	2016-11-15 10:40:42	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 23:48:32	t	t	t	\N
156	299	xubakka	0	2016-11-15 18:44:20	\N	25	2016-11-15 18:44:20	2016-11-15 21:44:20	2016-11-15 18:44:41	f	f	f	\N
141	311	tristan	2	2016-11-15 10:41:35	\N	86	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 22:22:02	t	t	f	\N
142	312	dexter	3	2016-11-15 10:41:41	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 22:44:08	t	t	t	\N
144	314	Gus	3	2016-11-15 10:41:51	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 22:49:43	t	t	t	\N
148	318	Sonic Bibou	3	2016-11-15 10:42:18	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 23:05:37	t	t	t	\N
173	311	jibe79	3	2016-11-16 20:36:40	\N	100	2016-11-16 20:36:41	2016-11-16 23:36:41	2016-11-16 21:17:51	f	f	t	\N
145	315	ninalys	3	2016-11-15 10:41:58	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 23:50:16	t	t	t	\N
140	310	jibe79	2	2016-11-15 10:41:28	\N	75	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-15 23:59:16	t	t	f	\N
135	305	cox7	3	2016-11-15 10:41:00	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 06:45:02	t	t	t	\N
146	316	Cthulhu	1	2016-11-15 10:42:06	\N	90	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 08:20:29	t	f	f	\N
134	304	Ghibli	2	2016-11-15 10:40:53	\N	\N	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 08:40:10	t	t	f	\N
147	317	DIAMOND DOG	1	2016-11-15 10:42:12	\N	75	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 10:06:53	t	f	f	\N
139	309	bit&rrois56	2	2016-11-15 10:41:22	\N	\N	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 10:28:18	t	t	f	\N
149	319	tony25000	1	2016-11-15 10:42:25	\N	62	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 10:51:33	t	f	f	\N
159	309	King PHE	3	2016-11-16 10:42:01	\N	100	2016-11-16 10:42:01	2016-11-16 13:42:01	2016-11-16 10:52:13	f	f	t	\N
143	313	yoyo	2	2016-11-15 10:41:45	\N	63	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 11:14:20	t	t	f	\N
686	722	yuri nakamura	2	2016-12-08 19:13:05	\N	75	2016-12-08 19:13:06	2016-12-08 22:13:06	2016-12-08 19:13:26	f	f	f	\N
136	306	Feb	2	2016-11-15 10:41:05	\N	53	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 11:14:38	t	t	f	\N
137	307	King PHE	3	2016-11-15 10:41:11	\N	100	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 12:11:14	t	t	t	\N
161	319	Cthulhu	3	2016-11-16 12:28:58	\N	100	2016-11-16 12:28:58	2016-11-16 15:28:58	2016-11-16 12:29:06	f	t	t	\N
160	316	DIAMOND DOG	2	2016-11-16 11:57:10	\N	81	2016-11-16 11:57:10	2016-11-16 14:57:10	2016-11-16 12:39:15	f	t	f	\N
162	317	Sonic Bibou	3	2016-11-16 13:35:33	\N	100	2016-11-16 13:35:33	2016-11-16 16:35:33	2016-11-16 13:35:48	f	t	t	\N
132	302	denez	2	2016-11-15 10:40:37	\N	61	2016-11-15 22:18:43	2016-11-16 12:00:00	2016-11-16 14:48:09	t	t	f	\N
164	313	tristan	3	2016-11-16 15:16:50	\N	100	2016-11-16 15:16:51	2016-11-16 18:16:51	2016-11-16 15:22:06	f	f	t	\N
165	316	ninalys	2	2016-11-16 16:27:09	\N	81	2016-11-16 16:27:09	2016-11-16 19:27:09	2016-11-16 16:27:17	f	f	f	\N
692	730	greg972	\N	2016-12-09 15:11:33	\N	\N	2016-12-09 22:10:21	2016-12-10 12:00:00	\N	\N	\N	\N	\N
169	320	tony25000	3	2016-11-16 18:27:49	\N	100	2016-11-16 18:27:49	2016-11-16 21:27:49	2016-11-16 18:28:10	f	f	f	\N
166	316	Gus	3	2016-11-16 16:27:23	\N	100	2016-11-16 16:27:23	2016-11-16 19:27:23	2016-11-16 18:37:56	f	f	t	\N
168	311	Dexter	2	2016-11-16 18:01:05	\N	98	2016-11-16 18:01:05	2016-11-16 21:01:05	2016-11-16 19:09:15	f	f	f	\N
163	301	denez	2	2016-11-16 14:58:38	\N	55	2016-11-16 14:58:39	2016-11-16 17:58:39	2016-11-16 19:51:45	t	t	f	\N
171	306	cox7	3	2016-11-16 20:11:13	\N	100	2016-11-16 20:11:13	2016-11-16 23:11:13	2016-11-16 20:12:09	f	f	t	\N
170	304	JouGe.56	1	2016-11-16 19:51:14	\N	83	2016-11-16 19:51:14	2016-11-16 22:51:14	2016-11-16 20:58:02	f	f	f	\N
189	310	bit&rrois56	3	2016-11-17 09:48:06	\N	100	2016-11-17 09:48:06	2016-11-17 12:48:06	2016-11-17 09:48:10	f	f	t	\N
176	354	Marin	2	2016-11-16 23:00:24	\N	57	2016-11-17 21:18:25	2016-11-18 12:00:00	2016-11-18 13:51:56	t	t	f	\N
204	370	Gus	3	2016-11-17 18:27:58	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 09:56:04	t	t	t	\N
174	352	titouanjanis	3	2016-11-16 22:59:03	\N	100	2016-11-17 21:18:25	2016-11-18 12:00:00	2016-11-17 22:03:18	t	t	t	\N
209	375	bidou	3	2016-11-17 18:28:38	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-17 22:12:01	t	t	t	\N
210	374	bidou	3	2016-11-17 18:29:16	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-17 22:21:17	t	t	t	\N
179	356	yanice	3	2016-11-16 23:01:08	\N	100	2016-11-17 21:18:25	2016-11-18 12:00:00	2016-11-17 22:22:12	t	t	t	\N
215	351	titouanjanis	3	2016-11-17 22:03:44	\N	100	2016-11-17 22:03:44	2016-11-18 01:03:44	2016-11-17 22:52:04	t	t	t	\N
216	353	Shermi	2	2016-11-17 22:28:30	\N	60	2016-11-17 22:28:30	2016-11-18 01:28:30	2016-11-17 22:34:30	t	t	f	\N
212	373	Cthulhu	3	2016-11-17 18:29:55	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-17 23:02:34	t	t	t	\N
199	368	tristan	3	2016-11-17 18:27:00	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-17 23:05:06	t	t	t	\N
178	355	juleswarz	3	2016-11-16 23:00:47	\N	100	2016-11-18 12:00:00	2016-11-18 15:00:00	2016-11-17 23:26:57	t	t	t	\N
182	357	Chou	1	2016-11-16 23:02:08	\N	93	2016-11-17 21:18:25	2016-11-18 12:00:00	2016-11-17 23:29:35	t	f	f	\N
186	360	kheldar	2	2016-11-16 23:02:58	\N	56	2016-11-17 21:18:25	2016-11-18 12:00:00	2016-11-17 23:29:58	t	t	f	\N
217	360	xubakka	0	2016-11-17 23:30:51	\N	17	2016-11-17 23:30:51	2016-11-18 02:30:51	2016-11-17 23:31:02	f	f	f	\N
196	365	cox7	2	2016-11-17 18:26:40	\N	77	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-17 23:36:14	t	t	f	\N
211	372	ninalys	3	2016-11-17 18:29:46	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-17 23:36:42	t	t	t	\N
218	357	helbrecht l	3	2016-11-17 23:49:59	\N	100	2016-11-17 23:49:59	2016-11-18 02:49:59	2016-11-17 23:50:12	f	t	t	\N
192	363	Ghibli	2	2016-11-17 18:25:12	\N	62	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 09:46:16	t	t	f	\N
205	371	mikke	3	2016-11-17 18:28:02	\N	100	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 09:44:23	t	t	t	\N
200	369	ju	2	2016-11-17 18:27:04	\N	96	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 11:46:31	t	t	f	\N
190	361	denez	2	2016-11-17 18:25:04	\N	61	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 11:48:00	t	t	f	\N
191	362	denez	2	2016-11-17 18:25:07	\N	67	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 13:59:34	t	t	f	\N
185	359	xubakka	0	2016-11-16 23:02:41	\N	22	2016-11-17 21:18:25	2016-11-18 12:00:00	2016-11-18 18:44:22	f	f	f	\N
198	367	bit&rrois56	2	2016-11-17 18:26:54	\N	72	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 07:41:36	t	t	f	\N
197	366	Cthulhu	1	2016-11-17 18:26:45	\N	39	2016-11-17 21:58:47	2016-11-18 12:00:00	2016-11-18 09:44:59	t	f	f	\N
219	366	King PHE	2	2016-11-18 09:45:17	\N	71	2016-11-18 09:45:17	2016-11-18 12:45:17	2016-11-18 09:45:22	f	t	f	\N
221	367	tristan	3	2016-11-18 09:56:19	\N	100	2016-11-18 09:56:19	2016-11-18 12:56:19	2016-11-18 10:48:54	f	f	t	\N
222	353	juleswarz	3	2016-11-18 11:11:03	\N	100	2016-11-18 11:11:03	2016-11-18 14:11:03	2016-11-18 12:27:49	f	f	t	\N
224	362	Gus	2	2016-11-18 12:44:38	\N	49	2016-11-18 12:00:00	2016-11-18 15:00:00	2016-11-18 14:02:46	f	f	f	\N
225	358	Marin	3	2016-11-18 14:10:00	\N	100	2016-11-18 14:10:00	2016-11-18 17:10:00	2016-11-18 14:10:20	t	t	t	\N
226	365	dexter	2	2016-11-18 14:18:08	\N	60	2016-11-18 14:18:08	2016-11-18 17:18:08	2016-11-18 14:18:26	f	f	f	\N
220	364	Ghibli	2	2016-11-18 09:46:23	\N	70	2016-11-18 09:46:23	2016-11-18 12:46:23	2016-11-18 14:18:43	t	t	f	\N
227	369	bit&rrois56	3	2016-11-18 14:19:25	\N	100	2016-11-18 14:19:25	2016-11-18 17:19:25	2016-11-18 14:19:40	f	f	t	\N
228	367	dexter	2	2016-11-18 15:21:25	\N	84	2016-11-18 15:21:27	2016-11-18 18:21:27	2016-11-18 15:21:41	f	f	f	\N
229	354	Shermi	2	2016-11-18 18:41:43	\N	94	2016-11-18 18:41:43	2016-11-18 21:41:43	2016-11-18 18:41:59	f	f	f	\N
240	382	bit&rrois56	2	2016-11-19 12:54:04	\N	\N	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 12:28:57	t	t	f	\N
230	354	yanice	2	2016-11-18 18:42:19	\N	58	2016-11-18 18:42:19	2016-11-18 21:42:19	2016-11-18 18:42:40	f	f	f	\N
231	359	helbrecht l	3	2016-11-18 18:43:27	\N	100	2016-11-18 12:00:00	2016-11-18 15:00:00	2016-11-18 18:43:40	t	t	t	\N
232	359	kheldar	0	2016-11-18 18:46:09	\N	40	2016-11-18 18:46:09	2016-11-18 21:46:09	2016-11-18 18:46:22	f	f	f	\N
233	360	GUEWEN	3	2016-11-18 20:01:42	\N	100	2016-11-18 20:01:42	2016-11-18 23:01:42	2016-11-18 20:01:55	f	f	t	\N
244	386	ninalys	\N	2016-11-19 12:56:09	\N	\N	2016-11-19 22:02:46	2016-11-20 12:00:00	\N	\N	\N	\N	\N
687	722	p'tit denez	3	2016-12-08 19:13:52	\N	100	2016-12-08 19:13:52	2016-12-08 22:13:52	2016-12-08 19:14:00	f	f	t	\N
258	420	xubakka	\N	2016-11-19 15:40:11	\N	\N	2016-11-19 21:25:40	2016-11-20 12:00:00	\N	\N	\N	\N	\N
245	387	Ju	3	2016-11-19 12:58:44	\N	100	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:07:12	t	t	t	\N
247	389	cogbzh	3	2016-11-19 12:59:36	\N	100	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:07:27	t	t	t	\N
248	390	bidou	3	2016-11-19 12:59:52	\N	100	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:07:39	t	t	t	\N
239	381	cox7	3	2016-11-19 12:53:30	\N	100	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:08:18	t	t	t	\N
242	384	mikke	2	2016-11-19 12:55:09	\N	92	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:16:23	t	t	f	\N
241	383	neguess	2	2016-11-19 12:54:49	\N	80	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:24:14	t	t	f	\N
246	388	Diamond	0	2016-11-19 12:59:14	\N	33	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 00:53:08	f	f	f	\N
236	378	rose	1	2016-11-19 12:50:53	\N	48	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 08:30:27	t	f	f	\N
693	731	titouanjanis	\N	2016-12-09 15:11:56	\N	\N	2016-12-09 22:10:21	2016-12-10 12:00:00	\N	\N	\N	\N	\N
260	388	Ju	3	2016-11-20 09:54:09	\N	100	2016-11-20 09:54:09	2016-11-20 12:54:09	2016-11-20 10:47:47	t	t	t	\N
243	385	Gus	3	2016-11-19 12:55:58	\N	100	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 10:56:06	t	t	t	\N
237	379	Ghibli	2	2016-11-19 12:51:44	\N	\N	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 11:43:49	t	t	f	\N
254	417	helbrecht l	2	2016-11-19 15:39:17	\N	\N	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 12:00:47	t	t	f	\N
255	418	Sonic Bibou	3	2016-11-19 15:39:31	\N	\N	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 12:01:01	t	t	t	\N
259	420	kheldar	3	2016-11-19 15:40:26	\N	\N	2016-11-20 12:00:00	2016-11-20 15:00:00	2016-11-20 12:01:16	t	t	t	\N
253	416	Evan	3	2016-11-19 15:39:01	\N	\N	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 12:02:30	t	t	t	\N
252	415	yanice	1	2016-11-19 15:38:51	\N	\N	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 12:02:38	t	f	f	\N
264	386	cogbzh	3	2016-11-20 11:35:29	\N	\N	2016-11-20 12:00:00	2016-11-20 15:00:00	2016-11-20 12:13:02	t	t	t	\N
263	384	neguess52	3	2016-11-20 10:38:57	\N	100	2016-11-20 10:38:57	2016-11-20 13:38:57	2016-11-20 12:28:25	f	f	t	\N
266	380	bidou	1	2016-11-20 12:52:54	\N	43	2016-11-20 12:00:00	2016-11-20 15:00:00	2016-11-20 12:53:04	t	f	f	\N
256	419	Chou	3	2016-11-19 15:39:42	\N	\N	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 14:33:03	t	t	t	\N
271	417	Chou	\N	2016-11-20 14:33:41	\N	\N	2016-11-20 18:05:08	2016-11-20 21:05:08	\N	\N	\N	\N	\N
238	380	simon	3	2016-11-19 12:52:42	\N	100	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 15:20:29	t	t	t	\N
270	383	Gus	3	2016-11-20 13:59:08	\N	100	2016-11-20 13:59:08	2016-11-20 16:59:08	2016-11-20 15:22:39	f	f	t	\N
250	413	Shermi	1	2016-11-19 15:38:27	\N	62	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 16:51:53	t	f	f	\N
235	377	denez	2	2016-11-19 12:50:04	\N	55	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 19:13:33	t	t	f	\N
249	412	Gil2 latourette	3	2016-11-19 15:38:16	\N	100	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 20:14:20	t	t	t	\N
272	411	Gil2 latourette	3	2016-11-20 20:14:50	\N	100	2016-11-20 20:14:50	2016-11-20 23:14:50	2016-11-20 20:15:00	t	t	t	\N
251	414	Marin	3	2016-11-19 15:38:40	\N	100	2016-11-19 21:25:40	2016-11-20 12:00:00	2016-11-20 20:15:15	t	t	t	\N
273	415	Shermi	1	2016-11-20 20:15:31	\N	84	2016-11-20 20:15:31	2016-11-20 23:15:31	2016-11-20 20:16:01	f	f	f	\N
265	417	Sonic Bibou	2	2016-11-20 12:05:08	\N	84	2016-11-20 12:05:08	2016-11-20 15:05:08	2016-11-20 20:16:20	f	f	f	\N
267	417	Evan	3	2016-11-20 13:37:20	\N	100	2016-11-20 15:05:08	2016-11-20 18:05:08	2016-11-20 20:16:43	f	f	t	\N
274	413	Helbrecht	2	2016-11-20 20:28:46	\N	70	2016-11-20 20:28:46	2016-11-20 23:28:46	2016-11-20 20:29:05	f	t	f	\N
275	415	Chou	2	2016-11-20 20:30:09	\N	67	2016-11-20 20:30:09	2016-11-20 23:30:09	2016-11-20 20:30:39	f	t	f	\N
234	376	denez	0	2016-11-19 12:48:19	\N	47	2016-11-19 22:02:46	2016-11-20 12:00:00	2016-11-20 21:54:50	f	f	f	\N
276	376	rose écarlate	1	2016-11-20 21:55:00	\N	40	2016-11-20 21:55:00	2016-11-21 00:55:00	2016-11-20 21:55:09	t	f	f	\N
277	382	simon	2	2016-11-20 21:55:24	\N	97	2016-11-20 21:55:24	2016-11-21 00:55:24	2016-11-20 21:55:33	f	f	f	\N
278	377	DIAMOND DOG	0	2016-11-21 04:54:32	\N	33	2016-11-21 04:54:32	2016-11-21 07:54:32	2016-11-21 04:54:49	f	f	f	\N
303	442	helbrecht l	\N	2016-11-21 12:45:55	\N	\N	2016-11-21 21:10:58	2016-11-22 12:00:00	\N	\N	\N	\N	\N
292	434	bidou	3	2016-11-21 08:56:18	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-21 21:40:53	t	t	t	\N
290	432	Cog	3	2016-11-21 08:55:58	\N	\N	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-21 22:15:45	t	t	t	\N
306	444	Chou	3	2016-11-21 12:47:01	\N	100	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-21 23:04:20	t	t	t	\N
305	443	Sonic Bibou	2	2016-11-21 12:46:51	\N	70	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-21 23:05:09	t	t	f	\N
297	438	Shermi	2	2016-11-21 12:43:59	\N	97	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-22 11:46:12	t	t	f	\N
284	426	Neguess	2	2016-11-21 08:53:26	\N	90	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-21 23:58:51	t	t	f	\N
288	430	Ju	2	2016-11-21 08:55:35	\N	91	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 07:34:30	t	t	f	\N
282	424	Gil	1	2016-11-21 08:52:52	\N	55	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 07:33:49	t	f	f	\N
283	425	Diabo	3	2016-11-21 08:53:05	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 09:42:17	t	t	t	\N
293	435	Horizon	3	2016-11-21 08:56:27	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 11:07:44	t	t	t	\N
285	427	Gus	3	2016-11-21 08:53:47	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 11:07:48	t	t	t	\N
287	429	Cthulhu	3	2016-11-21 08:55:26	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 11:08:21	t	t	t	\N
291	433	Tony	3	2016-11-21 08:56:09	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 12:40:27	t	t	t	\N
298	439	Marin	0	2016-11-21 12:44:12	\N	37	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-22 12:49:32	f	f	f	\N
299	440	yanice	2	2016-11-21 12:44:22	\N	51	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-22 15:55:15	t	t	f	\N
280	422	Ghibli	2	2016-11-21 08:52:19	\N	\N	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 17:30:32	t	t	f	\N
289	431	Diamond	3	2016-11-21 08:55:47	\N	100	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-21 22:37:51	t	t	t	\N
296	437	Super VegeDave	3	2016-11-21 12:43:43	\N	100	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-21 23:05:21	t	t	t	\N
688	717	Evan	1	2016-12-08 19:14:37	\N	47	2016-12-08 19:14:37	2016-12-08 22:14:37	2016-12-08 19:14:48	f	f	f	\N
286	428	ninalys	2	2016-11-21 08:54:19	\N	78	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 07:33:06	t	t	f	\N
281	423	Cox	2	2016-11-21 08:52:36	\N	71	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 11:08:10	t	t	f	\N
341	460	cox7	1	2016-11-23 16:14:13	\N	53	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 09:35:58	t	f	f	\N
309	443	Evan	3	2016-11-22 11:25:14	\N	100	2016-11-22 11:25:14	2016-11-22 14:25:14	2016-11-22 11:25:48	f	f	t	\N
294	436	Super VegeDave	2	2016-11-21 12:43:14	\N	71	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-22 11:26:06	t	t	f	\N
338	457	denez	2	2016-11-23 16:13:12	\N	63	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 09:46:36	t	t	f	\N
310	442	Evan	1	2016-11-22 12:25:02	\N	80	2016-11-22 12:00:00	2016-11-22 15:00:00	2016-11-22 12:25:35	t	f	f	\N
313	442	xubakka	3	2016-11-22 13:54:21	\N	100	2016-11-22 13:54:21	2016-11-22 16:54:22	2016-11-22 13:54:31	t	t	t	\N
311	439	Shermi	3	2016-11-22 13:15:19	\N	100	2016-11-22 13:15:19	2016-11-22 16:15:19	2016-11-22 14:12:32	t	t	t	\N
314	438	marin	2	2016-11-22 15:19:04	\N	60	2016-11-22 15:19:04	2016-11-22 18:19:04	2016-11-22 15:19:21	f	f	f	\N
316	430	DIAMOND DOG	1	2016-11-22 15:26:05	\N	71	2016-11-22 15:26:06	2016-11-22 18:26:06	2016-11-22 15:26:49	f	f	f	\N
317	441	yanice	\N	2016-11-22 15:56:18	\N	\N	2016-11-22 18:19:47	2016-11-22 21:19:47	\N	\N	\N	\N	\N
318	430	Cthulhu	2	2016-11-22 16:36:04	\N	\N	2016-11-22 16:36:05	2016-11-22 19:36:05	2016-11-22 16:50:26	f	f	f	\N
279	421	Denez	0	2016-11-21 08:51:58	\N	31	2016-11-21 21:26:39	2016-11-22 12:00:00	2016-11-22 16:54:43	f	f	f	\N
312	426	Gus	2	2016-11-22 13:50:11	\N	82	2016-11-22 13:50:11	2016-11-22 16:50:11	2016-11-22 17:12:48	f	f	f	\N
320	421	Ghibli	\N	2016-11-22 17:30:17	\N	\N	2016-11-22 17:30:17	2016-11-22 20:30:17	\N	\N	\N	\N	\N
319	426	...Diabolesse..	3	2016-11-22 17:12:23	\N	100	2016-11-22 16:50:11	2016-11-22 19:50:11	2016-11-22 18:26:28	f	f	t	\N
322	428	neguess52	\N	2016-11-22 18:26:52	\N	\N	2016-11-22 18:26:52	2016-11-22 21:26:52	\N	\N	\N	\N	\N
324	430	tony25000	1	2016-11-22 19:55:50	\N	77	2016-11-22 22:01:57	2016-11-23 01:01:57	2016-11-22 19:56:05	t	f	f	\N
323	430	cogbzh	2	2016-11-22 19:01:56	\N	82	2016-11-22 19:01:57	2016-11-22 22:01:57	2016-11-22 21:17:52	f	f	f	\N
307	445	kheldar	3	2016-11-21 12:47:36	\N	100	2016-11-21 21:10:58	2016-11-22 12:00:00	2016-11-23 08:53:17	t	t	t	\N
351	469	cogbzh	3	2016-11-23 16:16:44	\N	\N	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 21:51:35	t	t	t	\N
352	470	Bidou	3	2016-11-23 16:16:56	\N	\N	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 21:51:52	t	t	t	\N
350	468	ju	3	2016-11-23 16:16:32	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 22:19:47	t	t	t	\N
325	447	Shermi	2	2016-11-23 08:55:42	\N	94	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-23 22:19:51	t	t	f	\N
343	462	jibe79	3	2016-11-23 16:14:42	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 22:35:56	t	t	t	\N
339	458	JouGe.56	1	2016-11-23 16:13:43	\N	69	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 22:39:05	t	f	f	\N
342	461	...Diabolesse..	3	2016-11-23 16:14:24	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 22:42:12	t	t	t	\N
344	463	neguess52	3	2016-11-23 16:14:53	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-23 23:25:50	t	t	t	\N
340	459	Ghibli	2	2016-11-23 16:14:02	\N	80	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 08:01:26	t	t	f	\N
349	467	Cthulhu	3	2016-11-23 16:16:06	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 09:35:21	t	t	t	\N
348	466	ninalys	2	2016-11-23 16:15:44	\N	83	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 09:35:30	t	t	f	\N
353	466	mikke	3	2016-11-24 09:35:37	\N	100	2016-11-24 09:35:37	2016-11-24 12:35:37	2016-11-24 09:35:41	f	f	t	\N
346	464	mikke	3	2016-11-23 16:15:17	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 09:35:44	t	t	t	\N
347	465	Gus	3	2016-11-23 16:15:34	\N	100	2016-11-23 21:15:13	2016-11-24 12:00:00	2016-11-24 10:10:25	t	t	t	\N
355	460	...Diabolesse..	2	2016-11-24 10:09:03	\N	69	2016-11-24 10:09:03	2016-11-24 13:09:03	2016-11-24 10:44:24	f	t	f	\N
354	458	denez	2	2016-11-24 10:08:48	\N	57	2016-11-24 10:08:48	2016-11-24 13:08:48	2016-11-24 10:56:56	f	t	f	\N
356	456	JouGe.56	1	2016-11-24 10:09:15	\N	46	2016-11-24 10:09:15	2016-11-24 13:09:15	2016-11-24 11:16:02	t	f	f	\N
357	456	cox7	1	2016-11-24 16:06:52	\N	50	2016-11-24 16:06:52	2016-11-24 19:06:52	2016-11-24 16:06:55	f	f	f	\N
358	456	Gus	0	2016-11-24 16:06:59	\N	33	2016-11-24 16:06:59	2016-11-24 19:06:59	2016-11-24 16:07:04	f	f	f	\N
328	450	xubakka	3	2016-11-23 08:56:13	\N	100	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 17:11:50	t	t	t	\N
332	454	Chou	3	2016-11-23 08:56:54	\N	100	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 17:12:07	t	t	t	\N
337	455	Chou	3	2016-11-23 09:10:21	\N	100	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 17:12:16	t	t	t	\N
326	448	Brooks	2	2016-11-23 08:55:50	\N	86	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 18:31:16	t	t	f	\N
327	449	Marin	2	2016-11-23 08:55:59	\N	77	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 18:31:24	t	t	f	\N
330	452	helbrecht l	3	2016-11-23 08:56:36	\N	100	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 18:31:42	t	t	t	\N
331	453	Sonic Bibou	3	2016-11-23 08:56:46	\N	100	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 18:31:53	t	t	t	\N
359	451	helbrecht l	2	2016-11-24 18:34:42	\N	65	2016-11-24 12:00:00	2016-11-24 15:00:00	2016-11-24 18:34:54	t	t	f	\N
329	451	Evan	1	2016-11-23 08:56:22	\N	40	2016-11-23 21:22:09	2016-11-24 12:00:00	2016-11-24 18:36:26	t	f	f	\N
360	459	neguess52	1	2016-11-24 18:51:30	\N	34	2016-11-24 18:51:30	2016-11-24 21:51:30	2016-11-24 18:51:47	f	f	f	\N
361	449	Evan	1	2016-11-24 20:06:59	\N	77	2016-11-24 20:06:59	2016-11-24 23:06:59	2016-11-24 20:10:52	f	f	f	\N
363	446	Shermi	3	2016-11-24 20:53:06	\N	100	2016-11-24 20:53:06	2016-11-24 23:53:06	2016-11-24 20:53:32	t	t	t	\N
370	488	chou	\N	2016-11-25 00:28:56	\N	\N	2016-11-25 21:38:59	2016-11-26 12:00:00	\N	\N	\N	\N	\N
385	504	tony25000	3	2016-11-25 15:01:59	\N	100	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-26 00:28:44	t	t	t	\N
381	500	ninalys	\N	2016-11-25 15:01:00	\N	\N	2016-11-25 22:00:52	2016-11-26 12:00:00	\N	\N	\N	\N	\N
382	501	Cthulhu	\N	2016-11-25 15:01:19	\N	\N	2016-11-25 22:00:52	2016-11-26 12:00:00	\N	\N	\N	\N	\N
386	505	Horizon	\N	2016-11-25 15:02:11	\N	\N	2016-11-25 22:00:52	2016-11-26 12:00:00	\N	\N	\N	\N	\N
388	451	Brooks	3	2016-11-25 17:37:13	\N	100	2016-11-25 17:37:13	2016-11-25 20:37:13	2016-11-25 17:37:21	f	f	t	\N
389	448	Marin	2	2016-11-25 17:37:49	\N	64	2016-11-25 17:37:49	2016-11-25 20:37:49	2016-11-25 17:38:30	f	f	f	\N
383	502	ju	3	2016-11-25 15:01:27	\N	100	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-25 23:08:28	t	t	t	\N
384	503	DIAMOND DOG	3	2016-11-25 15:01:47	\N	100	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-25 23:08:46	t	t	t	\N
375	494	JouGe.56	1	2016-11-25 14:58:48	\N	67	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-25 23:52:09	t	f	f	\N
365	483	shermi	2	2016-11-25 00:27:49	\N	72	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-25 23:53:53	t	t	f	\N
364	482	titouanjanis	1	2016-11-25 00:27:37	\N	73	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-25 23:54:58	t	f	f	\N
380	499	mikke	2	2016-11-25 15:00:51	\N	87	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-26 00:00:15	t	t	f	\N
376	495	cox7	2	2016-11-25 14:59:23	\N	62	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-26 00:13:20	t	t	f	\N
387	505	bidou	3	2016-11-25 15:02:24	\N	100	2016-11-26 12:00:00	2016-11-26 15:00:00	2016-11-26 01:58:07	t	t	t	\N
379	498	neguess52	3	2016-11-25 15:00:37	\N	100	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-26 07:57:47	t	t	t	\N
369	487	helbrecht l	1	2016-11-25 00:28:47	\N	81	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-26 11:24:45	t	f	f	\N
372	490	kheldar jr	3	2016-11-25 00:29:30	\N	100	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-26 11:25:09	t	t	t	\N
368	486	sylvain	2	2016-11-25 00:28:36	\N	81	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-26 18:01:27	t	t	f	\N
390	449	xubakka	3	2016-11-25 17:39:03	\N	100	2016-11-25 17:39:04	2016-11-25 20:39:04	2016-11-25 17:39:13	f	f	t	\N
371	489	p'tit denez	3	2016-11-25 00:29:08	\N	100	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-25 22:52:23	t	t	t	\N
373	492	MiniCox7	1	2016-11-25 14:58:27	\N	61	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-25 23:52:19	t	f	f	\N
374	493	denez	2	2016-11-25 14:58:37	\N	88	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-25 23:58:09	t	t	f	\N
393	494	cox7	2	2016-11-26 00:12:41	\N	55	2016-11-26 00:12:41	2016-11-26 03:12:41	2016-11-26 00:12:59	f	t	f	\N
378	497	dexter	2	2016-11-25 15:00:08	\N	84	2016-11-25 22:00:52	2016-11-26 12:00:00	2016-11-26 00:22:45	t	t	f	\N
395	491	MiniCox7	2	2016-11-26 00:41:41	\N	68	2016-11-26 00:41:41	2016-11-26 03:41:41	2016-11-26 00:46:33	t	t	f	\N
391	500	mikke	2	2016-11-25 23:59:34	\N	\N	2016-11-26 12:00:00	2016-11-26 15:00:00	2016-11-26 07:58:33	t	t	f	\N
396	501	ju	\N	2016-11-26 10:32:20	\N	\N	2016-11-26 12:00:00	2016-11-26 15:00:00	\N	\N	\N	\N	\N
367	485	juleswarz	3	2016-11-25 00:28:18	\N	100	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-26 11:24:07	t	t	t	\N
397	497	jibe79	3	2016-11-26 11:28:10	\N	100	2016-11-26 11:28:11	2016-11-26 14:28:11	2016-11-26 11:28:19	f	f	t	\N
394	492	denez	1	2016-11-26 00:41:33	\N	50	2016-11-26 00:41:33	2016-11-26 03:41:33	2016-11-26 11:35:12	f	f	f	\N
398	500	neguess52	3	2016-11-26 11:34:35	\N	100	2016-11-26 11:34:36	2016-11-26 14:34:36	2016-11-26 11:55:04	t	t	t	\N
400	499	DIAMOND DOG	3	2016-11-26 14:26:09	\N	100	2016-11-26 14:26:09	2016-11-26 17:26:09	2016-11-26 15:00:59	f	f	t	\N
401	487	sylvain	1	2016-11-26 17:26:17	\N	69	2016-11-26 17:26:17	2016-11-26 20:26:17	2016-11-26 17:26:35	f	f	f	\N
402	488	helbrecht l	3	2016-11-26 17:30:03	\N	100	2016-11-26 12:00:00	2016-11-26 15:00:00	2016-11-26 17:30:16	t	t	t	\N
403	482	Shermi	2	2016-11-26 17:42:00	\N	56	2016-11-26 17:42:01	2016-11-26 20:42:01	2016-11-26 17:51:37	f	t	f	\N
404	481	titouanjanis	1	2016-11-26 18:01:51	\N	72	2016-11-26 18:01:51	2016-11-26 21:01:51	2016-11-26 18:02:04	t	f	f	\N
405	487	tristan	2	2016-11-26 18:02:36	\N	94	2016-11-26 18:02:37	2016-11-26 21:02:37	2016-11-26 18:05:25	f	t	f	\N
366	484	Brooks	3	2016-11-25 00:28:04	\N	100	2016-11-25 21:38:59	2016-11-26 12:00:00	2016-11-26 18:14:37	t	t	t	\N
406	502	tony25000	3	2016-11-26 20:10:38	\N	100	2016-11-26 20:10:38	2016-11-26 23:10:38	2016-11-26 20:10:48	f	f	f	\N
407	496	dexter	2	2016-11-26 20:41:48	\N	85	2016-11-26 20:41:48	2016-11-26 23:41:48	2016-11-26 20:42:01	t	t	f	\N
408	481	Brooks	3	2016-11-26 21:35:31	\N	100	2016-11-26 21:35:31	2016-11-27 00:35:31	2016-11-26 21:35:41	f	t	t	\N
409	486	Marin	2	2016-11-26 21:37:31	\N	83	2016-11-26 21:37:31	2016-11-27 00:37:31	2016-11-26 21:38:13	f	f	f	\N
410	486	Chou	1	2016-11-26 21:38:37	\N	52	2016-11-26 21:38:37	2016-11-27 00:38:37	2016-11-26 21:38:56	f	f	f	\N
411	487	Marin	1	2016-11-26 21:39:14	\N	60	2016-11-26 21:39:14	2016-11-27 00:39:14	2016-11-26 21:39:32	f	f	f	\N
412	487	Chou	1	2016-11-26 21:39:58	\N	65	2016-11-26 21:39:58	2016-11-27 00:39:58	2016-11-26 21:40:13	f	f	f	\N
413	510	cox7	\N	2016-11-26 23:01:09	\N	\N	2016-11-27 21:31:39	2016-11-28 12:00:00	\N	\N	\N	\N	\N
423	520	bidou	3	2016-11-26 23:03:56	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-27 21:53:52	t	t	t	\N
438	518	ninalys	2	2016-11-27 22:47:44	\N	50	2016-11-27 22:47:44	2016-11-28 01:47:44	2016-11-27 22:53:03	t	t	f	\N
424	522	titouanjanis	1	2016-11-27 00:06:20	\N	77	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-27 21:54:47	t	f	f	\N
430	526	jule	3	2016-11-27 00:07:35	\N	100	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-27 21:59:15	t	t	t	\N
416	513	jibe79	3	2016-11-26 23:01:45	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-27 22:20:55	t	t	t	\N
414	511	cox7	3	2016-11-26 23:01:17	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-27 22:46:32	t	t	t	\N
437	517	DIAMOND DOG	3	2016-11-27 22:47:13	\N	100	2016-11-27 22:47:13	2016-11-28 01:47:13	2016-11-27 22:47:23	t	t	t	\N
427	523	Shermi	2	2016-11-27 00:06:56	\N	71	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 13:21:05	t	t	f	\N
439	509	JouGe.56	3	2016-11-27 23:03:43	\N	100	2016-11-27 23:03:43	2016-11-28 02:03:43	2016-11-28 00:00:52	t	t	t	\N
441	507	MiniCox7	2	2016-11-28 00:01:16	\N	85	2016-11-28 00:01:16	2016-11-28 03:01:16	2016-11-28 00:01:25	t	t	f	\N
419	516	Mikke	3	2016-11-26 23:03:13	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-28 00:23:37	t	t	t	\N
417	514	neguess52	3	2016-11-26 23:02:43	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-28 00:39:36	t	t	t	\N
422	519	tony25000	3	2016-11-26 23:03:46	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-28 01:07:49	t	t	t	\N
428	524	Brooks	3	2016-11-27 00:07:07	\N	100	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 08:31:59	t	t	t	\N
431	527	sylvain	3	2016-11-27 00:07:48	\N	100	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 08:32:14	t	t	t	\N
418	515	mikke	3	2016-11-26 23:03:04	\N	100	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-28 09:57:43	t	t	t	\N
433	529	Chou	3	2016-11-27 00:08:13	\N	100	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 11:35:11	t	t	t	\N
444	518	neguess52	3	2016-11-28 11:20:52	\N	100	2016-11-28 11:20:52	2016-11-28 14:20:52	2016-11-28 11:45:19	f	f	t	\N
443	508	denez	1	2016-11-28 09:56:16	\N	59	2016-11-28 09:56:16	2016-11-28 12:56:16	2016-11-28 12:11:39	t	f	f	\N
429	525	juleswarz	2	2016-11-27 00:07:18	\N	94	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 12:35:03	t	t	f	\N
445	510	rose écarlate	2	2016-11-28 12:47:58	\N	95	2016-11-28 12:00:00	2016-11-28 15:00:00	2016-11-28 13:00:04	t	t	f	\N
447	506	MiniCox7	1	2016-11-28 13:47:13	\N	66	2016-11-28 13:47:13	2016-11-28 16:47:13	2016-11-28 13:48:00	t	f	f	\N
446	508	JouGe.56	1	2016-11-28 13:47:05	\N	39	2016-11-28 13:47:05	2016-11-28 16:47:05	2016-11-28 13:48:22	f	f	f	\N
448	512	cox7	3	2016-11-28 13:48:59	\N	100	2016-11-28 12:00:00	2016-11-28 15:00:00	2016-11-28 13:49:17	t	t	t	\N
415	512	King PHE	2	2016-11-26 23:01:37	\N	99	2016-11-27 21:31:39	2016-11-28 12:00:00	2016-11-28 13:49:38	t	t	f	\N
449	510	dexter	2	2016-11-28 15:23:13	\N	59	2016-11-28 15:23:13	2016-11-28 18:23:13	2016-11-28 15:23:30	t	t	f	\N
451	512	dexter	2	2016-11-28 16:44:28	\N	86	2016-11-28 16:44:29	2016-11-28 19:44:29	2016-11-28 16:44:46	f	f	f	\N
450	523	juleswarz	2	2016-11-28 16:38:28	\N	50	2016-11-28 16:38:28	2016-11-28 19:38:28	2016-11-28 17:00:48	f	f	f	\N
452	510	King PHE	\N	2016-11-28 17:19:32	\N	\N	2016-11-28 17:19:32	2016-11-28 20:19:32	\N	\N	\N	\N	\N
453	525	Sylvain	1	2016-11-28 17:36:52	\N	53	2016-11-28 17:36:53	2016-11-28 20:36:53	2016-11-28 17:37:00	f	f	f	\N
454	522	helbrecht 1	3	2016-11-28 17:37:24	\N	100	2016-11-28 17:37:24	2016-11-28 20:37:24	2016-11-28 17:37:31	f	t	t	\N
434	530	yuri nakamura	2	2016-11-27 00:08:34	\N	94	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 17:38:04	t	t	f	\N
432	528	helbrecht l	3	2016-11-27 00:08:01	\N	100	2016-11-27 21:23:59	2016-11-28 12:00:00	2016-11-28 17:38:18	t	t	t	\N
456	530	chou	3	2016-11-28 17:38:53	\N	100	2016-11-28 21:00:00	2016-11-29 00:00:00	2016-11-28 17:39:00	t	t	t	\N
457	521	Shermi	2	2016-11-28 17:44:31	\N	62	2016-11-28 17:44:31	2016-11-28 20:44:31	2016-11-28 17:44:39	t	t	f	\N
458	506	denez	\N	2016-11-28 18:49:09	\N	\N	2016-11-28 18:49:09	2016-11-28 21:49:09	\N	\N	\N	\N	\N
459	508	rose écarlate	\N	2016-11-28 18:49:22	\N	\N	2016-11-28 18:49:22	2016-11-28 21:49:22	\N	\N	\N	\N	\N
460	518	tony25000	3	2016-11-28 19:26:41	\N	100	2016-11-28 19:26:41	2016-11-28 22:26:41	2016-11-28 19:26:52	f	f	f	\N
461	515	DIAMOND DOG	3	2016-11-28 19:36:14	\N	100	2016-11-28 19:36:15	2016-11-28 22:36:15	2016-11-28 19:36:34	f	f	f	\N
464	534	rose écarlate	\N	2016-11-29 09:24:33	\N	\N	2016-11-29 21:39:11	2016-11-30 12:00:00	\N	\N	\N	\N	\N
465	535	JouGe.56	2	2016-11-29 09:24:53	\N	63	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 22:18:27	t	t	f	\N
468	538	Kergwen	3	2016-11-29 09:25:46	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 22:18:42	t	t	t	\N
469	539	King PHE	3	2016-11-29 09:27:16	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-30 08:50:17	t	t	t	\N
463	533	denez	2	2016-11-29 09:24:16	\N	80	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-30 12:12:25	t	t	f	\N
462	532	MiniCox7	1	2016-11-29 09:23:52	\N	91	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-30 15:28:06	t	f	f	\N
478	549	sylvain	\N	2016-11-29 09:53:35	\N	\N	2016-11-29 21:26:53	2016-11-30 12:00:00	\N	\N	\N	\N	\N
479	550	helbrecht l	\N	2016-11-29 09:53:46	\N	\N	2016-11-29 21:26:53	2016-11-30 12:00:00	\N	\N	\N	\N	\N
486	555	xubakka	\N	2016-11-29 09:56:48	\N	\N	2016-11-30 12:00:00	2016-11-30 15:00:00	\N	\N	\N	\N	\N
466	536	Super VegeDave	3	2016-11-29 09:25:24	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 21:47:35	t	t	t	\N
477	548	juleswarz	2	2016-11-29 09:53:13	\N	64	2016-11-29 21:26:53	2016-11-30 12:00:00	2016-11-29 22:03:26	t	t	f	\N
470	540	jibe79	3	2016-11-29 09:27:28	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 22:19:32	t	t	t	\N
474	544	cogbzh	3	2016-11-29 09:29:29	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 22:19:56	t	t	t	\N
473	543	Cthulhu	3	2016-11-29 09:29:13	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 22:22:43	t	t	t	\N
475	545	bidou	3	2016-11-29 09:29:43	\N	100	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-29 23:04:26	t	t	t	\N
485	555	kheldar. jr	3	2016-11-29 09:56:27	\N	100	2016-11-29 21:26:53	2016-11-30 12:00:00	2016-11-29 23:16:12	t	t	t	\N
487	554	yuri nakamura	3	2016-11-29 23:16:28	\N	100	2016-11-30 12:00:00	2016-11-30 15:00:00	2016-11-29 23:16:39	t	t	t	\N
482	552	Chou	1	2016-11-29 09:55:17	\N	61	2016-11-29 21:26:53	2016-11-30 12:00:00	2016-11-29 23:18:19	t	f	f	\N
488	553	Eric L'Ancien	2	2016-11-29 23:17:03	\N	95	2016-11-30 12:00:00	2016-11-30 15:00:00	2016-11-29 23:37:43	t	t	f	\N
471	541	ninalys	2	2016-11-29 09:27:43	\N	97	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-30 00:25:57	t	t	f	\N
494	541	Cthulhu	2	2016-11-30 08:52:17	\N	\N	2016-11-30 08:52:17	2016-11-30 11:52:17	2016-11-30 09:48:21	f	f	f	\N
495	537	Kergwen	2	2016-11-30 10:34:31	\N	61	2016-11-30 12:00:00	2016-11-30 15:00:00	2016-11-30 10:58:06	t	t	f	\N
472	542	Thomas H 974	1	2016-11-29 09:27:57	\N	58	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-30 11:15:54	t	f	f	\N
496	531	MiniCox7	2	2016-11-30 11:16:16	\N	93	2016-11-30 11:16:16	2016-11-30 14:16:16	2016-11-30 11:16:26	t	t	f	\N
480	551	Lagertha	1	2016-11-29 09:55:00	\N	\N	2016-11-29 21:26:53	2016-11-30 12:00:00	2016-11-30 11:54:31	t	f	f	\N
497	533	Super VegeDave	1	2016-11-30 12:12:44	\N	40	2016-11-30 12:12:44	2016-11-30 15:12:44	2016-11-30 12:13:57	f	f	f	\N
467	537	cox7	1	2016-11-29 09:25:36	\N	66	2016-11-29 21:39:11	2016-11-30 12:00:00	2016-11-30 12:14:38	t	f	f	\N
483	553	yuri nakamura	3	2016-11-29 09:55:36	\N	100	2016-11-29 21:26:53	2016-11-30 12:00:00	2016-11-30 12:45:08	t	t	t	\N
476	547	Marin	3	2016-11-29 09:53:05	\N	100	2016-11-29 21:26:53	2016-11-30 12:00:00	2016-11-30 14:01:43	t	t	t	\N
500	534	JouGe.56	1	2016-11-30 15:38:54	\N	63	2016-11-30 12:00:00	2016-11-30 15:00:00	2016-11-30 15:55:28	t	f	f	\N
502	541	jibe79	3	2016-11-30 17:21:09	\N	100	2016-11-30 17:21:09	2016-11-30 20:21:09	2016-11-30 17:21:22	f	f	t	\N
503	542	ninalys	3	2016-11-30 17:21:37	\N	100	2016-11-30 17:21:37	2016-11-30 20:21:37	2016-11-30 17:21:46	f	t	t	\N
498	552	Lagertha	3	2016-11-30 12:42:29	\N	\N	2016-11-30 12:42:29	2016-11-30 15:42:29	2016-11-30 17:23:53	f	t	t	\N
504	532	denez	1	2016-11-30 18:07:32	\N	64	2016-11-30 18:07:33	2016-11-30 21:07:33	2016-11-30 18:07:40	f	f	f	\N
507	554	Eric L'Ancien	3	2016-11-30 19:11:17	\N	100	2016-11-30 19:11:17	2016-11-30 22:11:17	2016-11-30 19:11:39	f	f	f	\N
508	556	MiniCox7	\N	2016-11-30 23:04:18	\N	\N	2016-12-01 21:42:52	2016-12-02 12:00:00	\N	\N	\N	\N	\N
522	572	simon	\N	2016-12-01 11:44:30	\N	\N	2016-12-01 21:04:08	2016-12-02 12:00:00	\N	\N	\N	\N	\N
531	580	xubakka.jr	\N	2016-12-01 11:55:36	\N	\N	2016-12-02 12:00:00	2016-12-02 15:00:00	\N	\N	\N	\N	\N
530	580	kheldar.jr	3	2016-12-01 11:55:16	\N	100	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-01 21:56:20	t	t	t	\N
529	579	Eric L'Ancien	3	2016-12-01 11:54:56	\N	100	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-01 21:56:39	t	t	t	\N
511	559	JouGe.56	2	2016-11-30 23:05:05	\N	52	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-01 22:31:11	t	t	f	\N
523	573	juleswarz	2	2016-12-01 11:44:38	\N	77	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-01 22:35:33	t	t	f	\N
513	561	cox7	2	2016-11-30 23:05:36	\N	62	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-01 22:59:49	t	t	f	\N
510	558	denez	2	2016-11-30 23:04:45	\N	71	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-01 23:04:13	t	t	f	\N
520	569	cogbzh	3	2016-11-30 23:09:26	\N	100	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 07:19:45	t	t	t	\N
518	567	Cthulhu	3	2016-11-30 23:07:55	\N	100	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 08:49:19	t	t	t	\N
519	568	DIAMOND DOG	1	2016-11-30 23:08:19	\N	51	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 08:50:35	t	f	f	\N
512	560	Ghibli	2	2016-11-30 23:05:15	\N	\N	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 08:51:14	t	t	f	\N
536	563	jibe79	2	2016-12-02 13:52:17	\N	50	2016-12-02 13:52:17	2016-12-02 16:52:17	2016-12-02 13:52:26	t	t	f	\N
515	564	neguess52	3	2016-11-30 23:06:45	\N	100	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 08:51:45	t	t	t	\N
514	562	King PHE	1	2016-11-30 23:05:52	\N	64	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 13:53:19	t	f	f	\N
532	568	Cthulhu	3	2016-12-02 08:50:22	\N	\N	2016-12-02 08:50:22	2016-12-02 11:50:22	2016-12-02 09:01:52	f	t	t	\N
533	570	cogbzh	3	2016-12-02 09:35:43	\N	\N	2016-12-02 09:35:43	2016-12-02 12:35:43	2016-12-02 10:11:13	t	t	t	\N
535	565	neguess52	3	2016-12-02 13:43:37	\N	100	2016-12-02 12:00:00	2016-12-02 15:00:00	2016-12-02 14:32:58	t	t	t	\N
517	566	Gus	3	2016-11-30 23:07:33	\N	100	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 14:53:42	t	t	t	\N
524	574	xubakka	2	2016-12-01 11:44:59	\N	72	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-02 16:12:01	t	t	f	\N
525	575	sylvain	2	2016-12-01 11:45:14	\N	85	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-02 16:12:43	t	t	f	\N
526	576	helbrecht l	3	2016-12-01 11:45:25	\N	100	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-02 16:13:40	t	t	t	\N
527	577	Chou	2	2016-12-01 11:53:53	\N	77	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-02 16:14:05	t	t	f	\N
528	578	yuri nakamura	3	2016-12-01 11:54:46	\N	100	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-02 16:14:42	t	t	t	\N
538	574	juleswarz	2	2016-12-02 16:45:36	\N	76	2016-12-02 16:45:36	2016-12-02 19:45:36	2016-12-02 16:48:35	f	f	f	\N
541	567	DIAMOND DOG	3	2016-12-02 17:22:34	\N	100	2016-12-02 17:22:34	2016-12-02 20:22:34	2016-12-02 17:22:54	f	f	f	\N
540	563	King PHE	2	2016-12-02 17:19:21	\N	\N	2016-12-02 17:19:21	2016-12-02 20:19:21	2016-12-02 17:32:50	f	f	f	\N
542	577	Eric L'Ancien	1	2016-12-02 17:22:44	\N	64	2016-12-02 17:22:44	2016-12-02 20:22:44	2016-12-02 18:09:35	f	f	f	\N
537	562	Gus	2	2016-12-02 14:53:49	\N	51	2016-12-02 14:53:49	2016-12-02 17:53:49	2016-12-02 18:22:51	f	t	f	\N
543	562	jibe79	0	2016-12-02 17:59:56	\N	20	2016-12-02 20:53:49	2016-12-02 23:53:49	2016-12-02 18:22:59	f	f	f	\N
521	571	simon	2	2016-12-01 11:44:22	\N	50	2016-12-01 21:04:08	2016-12-02 12:00:00	2016-12-02 19:32:54	t	t	f	\N
544	575	xubakka	3	2016-12-02 20:00:38	\N	100	2016-12-02 20:00:39	2016-12-02 23:00:39	2016-12-02 20:00:47	f	f	t	\N
545	562	JouGe.56	1	2016-12-02 20:21:59	\N	52	2016-12-02 20:21:59	2016-12-02 23:21:59	2016-12-02 20:22:38	t	f	f	\N
539	562	Ghibli	1	2016-12-02 17:17:41	\N	59	2016-12-02 17:53:49	2016-12-02 20:53:49	2016-12-02 20:23:04	f	f	f	\N
509	557	frere norris	1	2016-11-30 23:04:30	\N	54	2016-12-01 21:42:52	2016-12-02 12:00:00	2016-12-02 20:23:43	t	f	f	\N
546	562	denez	\N	2016-12-02 21:01:27	\N	\N	2016-12-02 21:01:27	2016-12-03 00:01:27	\N	\N	\N	\N	\N
552	605	sylvain	\N	2016-12-02 22:53:41	\N	\N	2016-12-03 21:19:40	2016-12-04 12:00:00	\N	\N	\N	\N	\N
558	610	kheldar. jr	\N	2016-12-02 22:55:40	\N	\N	2016-12-04 12:00:00	2016-12-04 15:00:00	\N	\N	\N	\N	\N
556	609	Eric L'Ancien	3	2016-12-02 22:54:58	\N	100	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-03 22:08:39	t	t	t	\N
551	604	Evan	2	2016-12-02 22:52:45	\N	72	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-03 22:09:18	t	t	f	\N
549	602	juleswarz	1	2016-12-02 22:50:20	\N	76	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-04 11:48:41	t	f	f	\N
547	601	juleswarz	2	2016-12-02 22:49:51	\N	97	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-04 13:18:25	t	t	f	\N
554	607	LiaFarey	2	2016-12-02 22:54:02	\N	76	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-04 14:57:11	t	t	f	\N
555	608	yuri nakamura	3	2016-12-02 22:54:39	\N	100	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-04 14:57:46	t	t	t	\N
559	592	frere norris	\N	2016-12-03 10:26:49	\N	\N	2016-12-03 21:39:34	2016-12-04 12:00:00	\N	\N	\N	\N	\N
561	594	Ghibli	\N	2016-12-03 10:27:06	\N	\N	2016-12-03 21:39:34	2016-12-04 12:00:00	\N	\N	\N	\N	\N
557	610	Jouge56	3	2016-12-02 22:55:10	\N	100	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-03 22:08:26	t	t	t	\N
550	603	yanice	2	2016-12-02 22:52:35	\N	50	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-03 22:09:04	t	t	f	\N
566	599	DIAMOND DOG	3	2016-12-03 10:29:01	\N	100	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-03 23:27:52	t	t	t	\N
560	593	JouGe.56	1	2016-12-03 10:26:57	\N	67	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-04 08:39:06	t	f	f	\N
567	600	cogbzh	3	2016-12-03 10:29:16	\N	\N	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-04 10:02:37	t	t	t	\N
562	595	tristan	3	2016-12-03 10:28:09	\N	100	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-04 10:05:34	t	t	t	\N
563	596	neguess52	2	2016-12-03 10:28:25	\N	82	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-04 11:34:49	t	t	f	\N
689	715	sylvain	2	2016-12-08 19:15:01	\N	74	2016-12-08 19:15:02	2016-12-08 22:15:02	2016-12-08 19:15:15	t	t	f	\N
565	598	Gus	3	2016-12-03 10:28:50	\N	100	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-04 12:57:49	t	t	t	\N
564	597	mikke	2	2016-12-03 10:28:41	\N	99	2016-12-03 21:39:34	2016-12-04 12:00:00	2016-12-04 12:57:56	t	t	f	\N
570	596	tristan	1	2016-12-04 13:25:59	\N	62	2016-12-04 13:25:59	2016-12-04 16:25:59	2016-12-04 13:33:24	f	f	f	\N
553	606	ninalys	1	2016-12-02 22:53:54	\N	84	2016-12-03 21:19:40	2016-12-04 12:00:00	2016-12-04 14:56:58	t	f	f	\N
588	620	Cthulhu	3	2016-12-05 08:10:14	\N	100	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-05 23:56:46	t	t	t	\N
572	606	LiaFarey	\N	2016-12-04 15:11:18	\N	\N	2016-12-04 15:11:18	2016-12-04 18:11:18	\N	\N	\N	\N	\N
573	607	Eric L'Ancien	0	2016-12-04 15:34:45	\N	41	2016-12-04 15:34:45	2016-12-04 18:34:45	2016-12-04 16:00:43	f	f	f	\N
574	597	neguess52	\N	2016-12-04 16:03:26	\N	\N	2016-12-04 15:58:11	2016-12-04 18:58:11	\N	\N	\N	\N	\N
575	594	mikke	2	2016-12-04 16:04:31	\N	98	2016-12-04 12:00:00	2016-12-04 15:00:00	2016-12-04 16:04:49	t	t	f	\N
569	597	Gus	3	2016-12-04 12:58:11	\N	100	2016-12-04 12:58:11	2016-12-04 15:58:11	2016-12-04 16:32:34	f	f	t	\N
576	594	neguess52	2	2016-12-04 17:06:44	\N	55	2016-12-04 17:06:44	2016-12-04 20:06:44	2016-12-04 17:06:55	t	t	f	\N
577	594	JouGe.56	\N	2016-12-04 19:05:52	\N	\N	2016-12-04 19:05:52	2016-12-04 22:05:52	\N	\N	\N	\N	\N
578	592	DIAMOND DOG	0	2016-12-05 02:34:59	\N	28	2016-12-04 12:00:00	2016-12-04 15:00:00	2016-12-05 02:35:42	f	f	f	\N
598	650	Jibax	\N	2016-12-05 19:23:30	\N	\N	2016-12-05 22:04:25	2016-12-06 12:00:00	\N	\N	\N	\N	\N
602	649	yuri nakamura	\N	2016-12-05 19:24:03	\N	\N	2016-12-05 22:04:25	2016-12-06 12:00:00	\N	\N	\N	\N	\N
616	639	Sergio	\N	2016-12-05 19:26:09	\N	\N	2016-12-05 22:04:25	2016-12-06 12:00:00	\N	\N	\N	\N	\N
584	616	neguess52	1	2016-12-05 08:08:37	\N	62	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-05 22:31:40	t	f	f	\N
613	642	titouanjanis	2	2016-12-05 19:25:37	\N	67	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-05 22:51:55	t	t	f	\N
606	647	Sonic Bibou	1	2016-12-05 19:24:27	\N	93	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-05 22:52:18	t	f	f	\N
612	643	Brooks	3	2016-12-05 19:25:27	\N	100	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-05 23:15:28	t	t	t	\N
618	618	mikke	2	2016-12-05 23:56:25	\N	78	2016-12-05 23:56:25	2016-12-06 02:56:25	2016-12-05 23:56:38	t	t	f	\N
619	618	Gus	3	2016-12-05 23:56:52	\N	100	2016-12-05 23:56:52	2016-12-06 02:56:52	2016-12-05 23:57:00	f	f	t	\N
614	641	Gil2 latourette	3	2016-12-05 19:25:46	\N	100	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 00:36:18	t	t	t	\N
617	638	pro yo	2	2016-12-05 19:26:18	\N	83	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 00:37:14	t	t	f	\N
615	640	greg972	1	2016-12-05 19:25:57	\N	81	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 00:37:49	t	f	f	\N
611	644	yanice	2	2016-12-05 19:25:17	\N	82	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 00:38:04	t	t	f	\N
583	615	King PHE	1	2016-12-05 08:08:11	\N	\N	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-06 08:25:30	t	f	f	\N
585	617	mikke	2	2016-12-05 08:09:00	\N	\N	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-06 08:26:11	t	t	f	\N
581	613	Ghibli	2	2016-12-05 08:07:36	\N	\N	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-06 08:29:43	t	t	f	\N
623	611	MiniCox7	0	2016-12-06 10:38:58	\N	47	2016-12-06 10:38:58	2016-12-06 13:38:58	2016-12-06 10:39:31	f	f	f	\N
620	617	neguess52	2	2016-12-06 08:26:26	\N	\N	2016-12-06 08:26:26	2016-12-06 11:26:26	2016-12-06 10:40:55	f	f	f	\N
609	646	ninalys	2	2016-12-05 19:24:55	\N	99	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 10:17:34	t	t	f	\N
610	645	sylvain	3	2016-12-05 19:25:06	\N	100	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 10:17:51	t	t	t	\N
604	648	LiaFarey	3	2016-12-05 19:24:16	\N	100	2016-12-05 22:04:25	2016-12-06 12:00:00	2016-12-06 10:18:11	t	t	t	\N
587	619	ju	2	2016-12-05 08:09:53	\N	80	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-06 10:29:45	t	t	f	\N
582	614	cox7	1	2016-12-05 08:07:50	\N	66	2016-12-05 21:59:31	2016-12-06 12:00:00	2016-12-06 10:37:46	t	f	f	\N
624	619	cthulhu	2	2016-12-06 11:33:28	\N	96	2016-12-06 11:33:28	2016-12-06 14:33:28	2016-12-06 11:50:48	f	f	f	\N
630	617	cox7	3	2016-12-06 11:55:56	\N	100	2016-12-06 11:55:56	2016-12-06 14:55:56	2016-12-06 11:56:09	f	f	t	\N
626	612	MiniCox7	1	2016-12-06 11:54:44	\N	56	2016-12-06 12:00:00	2016-12-06 15:00:00	2016-12-06 12:04:44	t	f	f	\N
633	647	LiaFarey	2	2016-12-06 12:29:11	\N	89	2016-12-06 12:29:11	2016-12-06 15:29:11	2016-12-06 12:29:37	f	t	f	\N
634	646	Sonic Bibou	\N	2016-12-06 12:52:38	\N	\N	2016-12-06 12:52:38	2016-12-06 15:52:38	\N	\N	\N	\N	\N
628	614	denez	2	2016-12-06 11:55:11	\N	66	2016-12-06 11:55:11	2016-12-06 14:55:11	2016-12-06 17:06:59	f	t	f	\N
632	615	Ghibli	2	2016-12-06 11:56:33	\N	77	2016-12-06 11:56:33	2016-12-06 14:56:33	2016-12-06 17:08:03	f	t	f	\N
631	616	King PHE	3	2016-12-06 11:56:21	\N	100	2016-12-06 11:56:21	2016-12-06 14:56:21	2016-12-06 17:58:26	f	t	t	\N
629	619	Gus	3	2016-12-06 11:55:35	\N	100	2016-12-06 11:55:35	2016-12-06 14:55:35	2016-12-06 18:16:56	f	f	t	\N
635	596	frere norris	3	2016-12-07 13:54:06	\N	100	2016-12-07 13:54:06	2016-12-07 16:54:06	2016-12-07 13:54:10	f	f	t	\N
636	591	frere norris	2	2016-12-07 13:54:19	\N	70	2016-12-07 13:54:19	2016-12-07 16:54:19	2016-12-07 13:54:26	t	t	f	\N
637	592	Ghibli	2	2016-12-07 13:54:30	\N	55	2016-12-07 13:54:30	2016-12-07 16:54:30	2016-12-07 13:54:36	t	t	f	\N
638	593	Ghibli	2	2016-12-07 13:54:55	\N	64	2016-12-07 13:54:55	2016-12-07 16:54:55	2016-12-07 13:55:02	f	t	f	\N
644	699	rose écarlate	\N	2016-12-07 19:10:52	\N	\N	2016-12-07 22:20:06	2016-12-08 12:00:00	\N	\N	\N	\N	\N
640	615	denez	3	2016-12-07 13:56:47	\N	100	2016-12-07 13:56:47	2016-12-07 16:56:47	2016-12-07 13:56:54	f	f	t	\N
643	698	frere norris	\N	2016-12-07 19:10:41	\N	\N	2016-12-07 22:20:06	2016-12-08 12:00:00	\N	\N	\N	\N	\N
663	719	sylvain	3	2016-12-07 19:32:20	\N	100	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-07 23:39:52	t	t	t	\N
646	697	MiniCox7	0	2016-12-07 19:16:20	\N	49	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 06:51:21	f	f	f	\N
657	725	Kheldar-junior	3	2016-12-07 19:29:53	\N	100	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-07 22:20:22	t	t	t	\N
645	700	cox7	2	2016-12-07 19:14:01	\N	69	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-07 22:41:15	t	t	f	\N
656	702	Brooks	3	2016-12-07 19:19:42	\N	100	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-07 23:47:37	t	t	t	\N
648	710	Horizon	3	2016-12-07 19:18:50	\N	100	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-07 23:49:45	t	t	t	\N
653	705	mikke	1	2016-12-07 19:19:19	\N	59	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 00:34:13	t	f	f	\N
655	703	neguess52	2	2016-12-07 19:19:37	\N	62	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 09:17:50	t	t	f	\N
651	707	ju	3	2016-12-07 19:19:08	\N	100	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 09:46:48	t	t	t	\N
647	701	King PHE	2	2016-12-07 19:16:46	\N	50	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 12:41:23	t	t	f	\N
652	706	Gus	3	2016-12-07 19:19:13	\N	100	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 09:47:29	t	t	t	\N
654	704	helbrecht l	2	2016-12-07 19:19:32	\N	64	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 18:31:28	t	t	f	\N
682	703	Gus	2	2016-12-08 18:31:44	\N	73	2016-12-08 18:31:44	2016-12-08 21:31:44	2016-12-08 19:27:11	f	f	f	\N
661	721	Sonic Bibou	3	2016-12-07 19:31:53	\N	100	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-07 22:20:12	t	t	t	\N
669	713	pro yo	1	2016-12-07 19:33:52	\N	70	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-07 23:07:32	t	f	f	\N
667	715	greg972	0	2016-12-07 19:33:16	\N	48	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-07 23:07:49	f	f	f	\N
662	720	ninalys	1	2016-12-07 19:32:10	\N	66	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-07 23:08:14	t	f	f	\N
670	720	Sonic Bibou	3	2016-12-07 23:11:10	\N	100	2016-12-07 23:11:10	2016-12-08 02:11:10	2016-12-07 23:16:21	f	t	t	\N
681	704	mikke	1	2016-12-08 18:31:38	\N	90	2016-12-08 18:31:38	2016-12-08 21:31:38	2016-12-08 19:27:27	f	f	f	\N
671	724	yuri nakamura	3	2016-12-07 23:40:15	\N	100	2016-12-07 23:40:15	2016-12-08 02:40:15	2016-12-07 23:40:33	t	t	t	\N
672	723	p'tit denez	3	2016-12-07 23:40:45	\N	100	2016-12-07 23:40:45	2016-12-08 02:40:45	2016-12-07 23:47:55	t	t	t	\N
673	696	frere norris	2	2016-12-08 00:32:57	\N	54	2016-12-08 00:32:57	2016-12-08 03:32:57	2016-12-08 00:33:24	t	t	f	\N
650	708	Cthulhu	3	2016-12-07 19:19:02	\N	100	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 09:47:01	t	t	t	\N
649	709	DIAMOND DOG	3	2016-12-07 19:18:57	\N	100	2016-12-07 22:20:06	2016-12-08 12:00:00	2016-12-08 09:47:34	t	t	t	\N
697	735	chou	\N	2016-12-09 15:12:58	\N	\N	2016-12-09 22:10:21	2016-12-10 12:00:00	\N	\N	\N	\N	\N
665	717	yanice	2	2016-12-07 19:32:38	\N	61	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-08 11:27:34	t	t	f	\N
666	716	titouanjanis	3	2016-12-07 19:32:56	\N	100	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-08 11:30:04	t	t	t	\N
664	718	Evan	2	2016-12-07 19:32:29	\N	92	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-08 11:30:59	t	t	f	\N
676	718	Yanice	3	2016-12-08 14:40:06	\N	100	2016-12-08 14:40:06	2016-12-08 17:40:06	2016-12-08 14:40:22	f	f	t	\N
700	737	yuri nakamura	\N	2016-12-09 15:13:33	\N	\N	2016-12-09 22:10:21	2016-12-10 12:00:00	\N	\N	\N	\N	\N
675	705	neguess52	3	2016-12-08 11:57:48	\N	100	2016-12-08 11:57:48	2016-12-08 14:57:48	2016-12-08 15:08:55	f	t	t	\N
680	706	Cthulhu	1	2016-12-08 15:32:38	\N	\N	2016-12-08 15:32:38	2016-12-08 18:32:38	2016-12-08 15:32:45	f	f	f	\N
679	703	King PHE	2	2016-12-08 15:32:28	\N	98	2016-12-08 15:32:28	2016-12-08 18:32:28	2016-12-08 17:56:21	f	f	f	\N
683	698	MiniCox7	2	2016-12-08 18:47:14	\N	99	2016-12-08 12:00:00	2016-12-08 15:00:00	2016-12-08 18:47:19	t	t	f	\N
684	712	Gil2 latourette	2	2016-12-08 19:10:19	\N	76	2016-12-08 19:10:19	2016-12-08 22:10:19	2016-12-08 19:10:31	t	t	f	\N
668	714	Sergio	2	2016-12-07 19:33:42	\N	81	2016-12-07 22:12:01	2016-12-08 12:00:00	2016-12-08 19:10:46	t	t	f	\N
685	720	LiaFarey	2	2016-12-08 19:11:28	\N	81	2016-12-08 19:11:28	2016-12-08 22:11:28	2016-12-08 19:11:40	f	f	f	\N
704	740	xubakka	\N	2016-12-09 15:14:32	\N	\N	2016-12-10 12:00:00	2016-12-10 15:00:00	\N	\N	\N	\N	\N
713	750	mikke	\N	2016-12-09 19:16:42	\N	\N	2016-12-09 21:35:24	2016-12-10 12:00:00	\N	\N	\N	\N	\N
711	748	Dexter	3	2016-12-09 19:16:02	\N	100	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-09 23:33:30	t	t	t	\N
703	740	Jouge56	3	2016-12-09 15:14:23	\N	100	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-09 23:35:27	t	t	t	\N
716	753	Cthulhu	3	2016-12-09 19:17:16	\N	100	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-09 23:35:51	t	t	t	\N
717	754	DIAMOND DOG	3	2016-12-09 19:17:32	\N	100	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-09 23:35:59	t	t	t	\N
718	755	cogbzh	3	2016-12-09 19:17:49	\N	100	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-09 23:36:08	t	t	t	\N
715	752	ju	3	2016-12-09 19:17:08	\N	100	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 00:11:52	t	t	t	\N
701	738	p'tit denez	3	2016-12-09 15:13:51	\N	100	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 00:42:38	t	t	t	\N
691	729	Sergio	2	2016-12-09 15:11:24	\N	59	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 00:45:35	t	t	f	\N
696	734	Sonic Bibou	2	2016-12-09 15:12:50	\N	93	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 00:46:04	t	t	f	\N
699	736	LiaFarey	2	2016-12-09 15:13:20	\N	76	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 00:46:29	t	t	f	\N
690	728	pro yo	2	2016-12-09 15:11:13	\N	85	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 00:47:00	t	t	f	\N
702	739	kheldar.jr	1	2016-12-09 15:14:09	\N	64	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 00:47:15	t	f	f	\N
719	739	p'tit denez	3	2016-12-10 00:44:24	\N	100	2016-12-10 12:00:00	2016-12-10 15:00:00	2016-12-10 00:57:50	f	t	t	\N
694	732	jule	3	2016-12-09 15:12:20	\N	100	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 07:08:37	t	t	t	\N
712	749	neguess52	2	2016-12-09 19:16:27	\N	94	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 09:34:20	t	t	f	\N
714	751	Gus	3	2016-12-09 19:16:57	\N	100	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 09:34:41	t	t	t	\N
720	735	LiaFarey	\N	2016-12-10 12:04:52	\N	\N	2016-12-10 12:00:00	2016-12-10 15:00:00	\N	\N	\N	\N	\N
695	733	sylvain	3	2016-12-09 15:12:36	\N	100	2016-12-09 22:10:21	2016-12-10 12:00:00	2016-12-10 15:21:10	t	t	t	\N
722	734	sylvain	3	2016-12-10 15:21:22	\N	100	2016-12-10 15:21:22	2016-12-10 18:21:22	2016-12-10 15:21:34	f	f	t	\N
721	750	Gus	2	2016-12-10 13:34:02	\N	\N	2016-12-10 12:00:00	2016-12-10 15:00:00	2016-12-10 15:42:02	t	t	f	\N
723	750	neguess52	3	2016-12-10 15:41:37	\N	100	2016-12-10 15:00:00	2016-12-10 18:00:00	2016-12-10 15:49:36	t	t	t	\N
726	741	MiniCox7	0	2016-12-10 16:42:16	\N	37	2016-12-10 16:42:17	2016-12-10 19:42:17	2016-12-10 16:42:31	f	f	f	\N
705	742	MiniCox7	2	2016-12-09 19:14:20	\N	70	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 16:42:49	t	t	f	\N
706	743	frere norris	2	2016-12-09 19:14:32	\N	\N	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 16:43:02	t	t	f	\N
707	744	rose écarlate	2	2016-12-09 19:14:48	\N	\N	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 16:43:15	t	t	f	\N
708	745	Simon	1	2016-12-09 19:14:56	\N	\N	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 16:43:39	t	f	f	\N
709	746	cox7	2	2016-12-09 19:15:05	\N	\N	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 16:43:51	t	t	f	\N
727	747	Cthulhu	2	2016-12-10 16:44:02	\N	\N	2016-12-10 12:00:00	2016-12-10 15:00:00	2016-12-10 16:44:12	t	t	f	\N
710	747	King PHE	3	2016-12-09 19:15:21	\N	\N	2016-12-09 21:35:24	2016-12-10 12:00:00	2016-12-10 17:11:39	t	t	t	\N
725	749	dexter	2	2016-12-10 16:20:36	\N	\N	2016-12-10 19:18:31	2016-12-10 22:18:31	2016-12-10 17:48:18	f	f	f	\N
729	749	King PHE	2	2016-12-10 17:48:36	\N	\N	2016-12-10 17:48:36	2016-12-10 20:48:36	2016-12-10 17:57:34	f	f	f	\N
730	826	Rose	\N	2016-12-11 17:25:58	\N	\N	2016-12-11 21:58:25	2016-12-12 12:00:00	\N	\N	\N	\N	\N
733	829	Dave	\N	2016-12-11 17:26:35	\N	\N	2016-12-11 21:58:25	2016-12-12 12:00:00	\N	\N	\N	\N	\N
740	838	pro yo	\N	2016-12-11 19:41:36	\N	\N	2016-12-11 21:21:21	2016-12-12 12:00:00	\N	\N	\N	\N	\N
741	839	Sergio	\N	2016-12-11 19:41:46	\N	\N	2016-12-11 21:21:21	2016-12-12 12:00:00	\N	\N	\N	\N	\N
748	845	kheldar	\N	2016-12-11 19:43:04	\N	\N	2016-12-12 12:00:00	2016-12-12 15:00:00	\N	\N	\N	\N	\N
732	828	Vege	2	2016-12-11 17:26:25	\N	80	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-11 22:07:32	t	t	f	\N
746	844	Sonic Bibou	1	2016-12-11 19:42:44	\N	93	2016-12-11 21:21:21	2016-12-12 12:00:00	2016-12-11 22:14:51	t	f	f	\N
742	840	titouanjanis	3	2016-12-11 19:42:01	\N	100	2016-12-11 21:21:21	2016-12-12 12:00:00	2016-12-11 22:29:24	t	t	t	\N
745	843	sylvain	2	2016-12-11 19:42:29	\N	75	2016-12-11 21:21:21	2016-12-12 12:00:00	2016-12-11 22:30:34	t	t	f	\N
749	843	Sonic Bibou	\N	2016-12-11 22:30:56	\N	\N	2016-12-11 22:30:56	2016-12-12 01:30:56	\N	\N	\N	\N	\N
735	831	Neguess	3	2016-12-11 17:27:15	\N	100	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-11 22:55:47	t	t	t	\N
739	835	cogbzh	3	2016-12-11 17:28:15	\N	\N	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-11 23:23:59	t	t	t	\N
737	833	Ju	1	2016-12-11 17:27:53	\N	68	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-11 23:40:39	t	f	f	\N
743	841	juleswarz	2	2016-12-11 19:42:10	\N	83	2016-12-11 21:21:21	2016-12-12 12:00:00	2016-12-12 00:25:41	t	t	f	\N
736	832	Gus	3	2016-12-11 17:27:43	\N	100	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-12 12:49:27	t	t	t	\N
738	834	Cthulhu	3	2016-12-11 17:28:04	\N	100	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-12 12:23:05	t	t	t	\N
744	842	jule	3	2016-12-11 19:42:19	\N	100	2016-12-11 21:21:21	2016-12-12 12:00:00	2016-12-12 18:22:12	t	t	t	\N
747	845	chou	3	2016-12-11 19:42:53	\N	100	2016-12-11 21:21:21	2016-12-12 12:00:00	2016-12-12 20:02:30	t	t	t	\N
734	830	King	3	2016-12-11 17:27:06	\N	100	2016-12-11 21:58:25	2016-12-12 12:00:00	2016-12-12 12:22:22	t	t	t	\N
750	833	neguess52	3	2016-12-12 12:22:51	\N	\N	2016-12-12 12:22:51	2016-12-12 15:22:51	2016-12-12 14:06:45	f	t	t	\N
751	833	Cthulhu	1	2016-12-12 16:49:45	\N	\N	2016-12-12 16:49:46	2016-12-12 19:49:46	2016-12-12 16:49:53	f	f	f	\N
752	829	King PHE	\N	2016-12-12 16:52:52	\N	\N	2016-12-12 12:00:00	2016-12-12 15:00:00	\N	\N	\N	\N	\N
753	827	Vege	1	2016-12-12 17:20:35	\N	41	2016-12-12 17:20:35	2016-12-12 20:20:35	2016-12-12 17:20:47	t	f	f	\N
754	839	juleswarz	2	2016-12-12 19:03:57	\N	84	2016-12-12 12:00:00	2016-12-12 15:00:00	2016-12-12 19:10:24	t	t	f	\N
755	841	Gil2 latourette	1	2016-12-12 20:00:46	\N	65	2016-12-12 20:00:46	2016-12-12 23:00:46	2016-12-12 20:01:01	f	f	f	\N
759	861	juleswarz	3	2016-12-13 11:50:36	\N	100	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-13 22:07:46	t	t	t	\N
766	866	denez	2	2016-12-13 12:41:40	\N	51	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-13 23:13:05	t	t	f	\N
763	865	tristan	1	2016-12-13 11:52:00	\N	56	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 09:16:30	t	f	f	\N
761	863	sylvain	3	2016-12-13 11:51:24	\N	100	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 09:16:42	t	t	t	\N
760	862	Tony Du 56	3	2016-12-13 11:51:10	\N	100	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 09:17:35	t	t	t	\N
756	858	pro yo	2	2016-12-13 11:49:52	\N	87	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 09:18:42	t	t	f	\N
770	870	Gus	2	2016-12-13 12:41:57	\N	99	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 12:08:44	t	t	f	\N
769	869	mikke	2	2016-12-13 12:41:53	\N	94	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 12:08:48	t	t	f	\N
768	868	Gil2	2	2016-12-13 12:41:48	\N	73	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 12:09:24	t	t	f	\N
767	867	King PHE	0	2016-12-13 12:41:44	\N	47	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 12:59:22	f	f	f	\N
762	864	Chou	3	2016-12-13 11:51:33	\N	100	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 13:17:10	t	t	t	\N
777	865	Chou	3	2016-12-14 13:18:15	\N	100	2016-12-14 18:00:00	2016-12-14 21:00:00	2016-12-14 13:18:27	t	t	t	\N
758	860	Shermi	2	2016-12-13 11:50:27	\N	85	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 13:19:09	t	t	f	\N
757	859	Sergio	2	2016-12-13 11:50:03	\N	65	2016-12-13 21:59:13	2016-12-14 12:00:00	2016-12-14 13:19:20	t	t	f	\N
778	859	juleswarz	2	2016-12-14 13:19:41	\N	68	2016-12-14 13:19:41	2016-12-14 16:19:41	2016-12-14 14:20:25	f	f	f	\N
773	873	cogbzh	1	2016-12-13 12:42:17	\N	84	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 14:23:23	t	f	f	\N
771	871	ju	2	2016-12-13 12:42:01	\N	99	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 15:07:17	t	t	f	\N
772	872	DIAMOND	2	2016-12-13 12:42:06	\N	99	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 15:07:31	t	t	f	\N
780	872	Ju	\N	2016-12-14 15:07:40	\N	\N	2016-12-14 15:07:40	2016-12-14 18:07:40	\N	\N	\N	\N	\N
774	874	tony25000	2	2016-12-13 12:42:21	\N	81	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 15:28:09	t	t	f	\N
775	875	Horizon	2	2016-12-13 12:42:25	\N	74	2016-12-13 21:42:08	2016-12-14 12:00:00	2016-12-14 15:28:37	t	t	f	\N
781	874	cogbzh	\N	2016-12-14 15:28:56	\N	\N	2016-12-14 15:28:56	2016-12-14 18:28:56	\N	\N	\N	\N	\N
779	869	Gil2 latourette	3	2016-12-14 13:46:13	\N	100	2016-12-14 13:46:13	2016-12-14 16:46:13	2016-12-14 16:12:04	f	f	t	\N
776	867	denez	2	2016-12-14 12:59:33	\N	71	2016-12-14 12:59:33	2016-12-14 15:59:33	2016-12-14 16:37:52	t	t	f	\N
782	875	tony25000	3	2016-12-14 16:38:04	\N	100	2016-12-14 16:38:04	2016-12-14 19:38:04	2016-12-14 16:38:12	f	f	t	\N
783	873	DIAMOND DOG	3	2016-12-14 16:38:24	\N	100	2016-12-14 16:38:25	2016-12-14 19:38:25	2016-12-14 16:38:33	f	t	t	\N
786	878	Sergio	\N	2016-12-15 10:42:41	\N	\N	2016-12-15 22:06:01	2016-12-16 12:00:00	\N	\N	\N	\N	\N
787	879	pro yo	\N	2016-12-15 10:43:21	\N	\N	2016-12-15 22:06:01	2016-12-16 12:00:00	\N	\N	\N	\N	\N
794	885	xubakka.jr	\N	2016-12-15 10:46:12	\N	\N	2016-12-16 12:00:00	2016-12-16 15:00:00	\N	\N	\N	\N	\N
793	885	Jouge56	3	2016-12-15 10:45:54	\N	100	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-15 22:10:47	t	t	t	\N
808	898	cogbzh	3	2016-12-15 13:06:52	\N	\N	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-15 23:02:51	t	t	t	\N
809	899	tony25000	3	2016-12-15 13:07:19	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-15 23:37:01	t	t	t	\N
807	897	DIAMOND DOG	3	2016-12-15 13:06:30	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-15 23:37:12	t	t	t	\N
795	886	MiniCox7	1	2016-12-15 12:56:42	\N	55	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-15 23:41:19	t	f	f	\N
810	900	Horizon	3	2016-12-15 13:07:39	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 08:44:07	t	t	t	\N
804	894	Gus	3	2016-12-15 13:05:15	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 09:00:14	t	t	t	\N
806	896	Cthulhu	3	2016-12-15 13:06:08	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 09:00:52	t	t	t	\N
803	893	jac91	2	2016-12-15 13:04:45	\N	81	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 09:01:14	t	t	f	\N
801	891	Redoine	2	2016-12-15 13:03:42	\N	86	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 09:01:23	t	t	f	\N
800	890	Gil2 latourette	1	2016-12-15 13:03:09	\N	65	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 09:01:39	t	f	f	\N
805	895	ju	3	2016-12-15 13:05:45	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 09:26:50	t	t	t	\N
812	883	Redoinei	\N	2016-12-16 09:50:51	\N	\N	2016-12-16 12:00:00	2016-12-16 15:00:00	\N	\N	\N	\N	\N
792	884	kheldar	3	2016-12-15 10:45:39	\N	100	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 10:18:56	t	t	t	\N
791	883	tristan	3	2016-12-15 10:44:42	\N	100	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 10:19:13	t	t	t	\N
790	882	Chou	3	2016-12-15 10:44:35	\N	100	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 10:19:49	t	t	t	\N
789	881	sylvain	3	2016-12-15 10:44:28	\N	100	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 10:20:17	t	t	t	\N
802	892	helbrecht l	2	2016-12-15 13:04:18	\N	83	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 11:00:13	t	t	f	\N
785	877	patt	2	2016-12-15 10:42:26	\N	67	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 11:22:16	t	t	f	\N
797	887	MiniCox7	2	2016-12-15 12:57:05	\N	62	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 11:57:17	t	t	f	\N
815	880	Sylvain	3	2016-12-16 15:33:16	\N	100	2016-12-16 15:00:00	2016-12-16 18:00:00	2016-12-16 15:33:33	t	t	t	\N
813	893	Redoine	3	2016-12-16 11:00:57	\N	100	2016-12-16 11:00:57	2016-12-16 14:00:57	2016-12-16 12:18:01	f	f	t	\N
788	880	Shermi	1	2016-12-15 10:44:17	\N	\N	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 14:27:04	t	f	f	\N
798	888	denez	3	2016-12-15 12:59:31	\N	100	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 14:57:06	t	t	t	\N
799	889	King PHE	2	2016-12-15 13:02:40	\N	83	2016-12-15 21:01:10	2016-12-16 12:00:00	2016-12-16 14:57:23	t	t	f	\N
816	879	Shermi	3	2016-12-16 15:34:01	\N	100	2016-12-16 12:00:00	2016-12-16 15:00:00	2016-12-16 15:34:29	t	t	t	\N
818	890	jac91	\N	2016-12-16 15:49:45	\N	\N	2016-12-16 15:49:45	2016-12-16 18:49:45	\N	\N	\N	\N	\N
817	891	Gil2 latourette	3	2016-12-16 15:35:32	\N	100	2016-12-16 15:35:32	2016-12-16 18:35:32	2016-12-16 16:06:21	f	f	t	\N
821	886	denez	1	2016-12-16 17:22:42	\N	50	2016-12-16 17:22:42	2016-12-16 20:22:42	2016-12-16 18:37:15	f	f	f	\N
784	876	patt	2	2016-12-15 10:42:15	\N	54	2016-12-15 22:06:01	2016-12-16 12:00:00	2016-12-16 19:33:20	t	t	f	\N
820	892	bit&rrois56	3	2016-12-16 16:35:10	\N	100	2016-12-16 16:35:10	2016-12-16 19:35:10	2016-12-16 18:40:36	f	f	t	\N
822	878	pro yo	1	2016-12-16 19:50:39	\N	53	2016-12-16 12:00:00	2016-12-16 15:00:00	2016-12-16 19:51:16	t	f	f	\N
823	890	DIAMOND DOG	1	2016-12-16 19:55:56	\N	30	2016-12-16 18:49:45	2016-12-16 21:49:45	2016-12-16 19:56:25	t	f	f	\N
824	890	tony25000	1	2016-12-16 19:57:09	\N	34	2016-12-16 19:57:09	2016-12-16 22:57:09	2016-12-16 20:08:11	t	f	f	\N
829	906	neguess52	3	2016-12-16 22:53:45	\N	100	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-17 23:31:48	t	t	t	\N
830	907	Gus	3	2016-12-16 22:54:13	\N	100	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-17 23:32:47	t	t	t	\N
827	903	sanka	2	2016-12-16 22:52:57	\N	99	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-18 07:57:45	t	t	f	\N
825	901	MiniCox7	2	2016-12-16 22:52:35	\N	92	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-18 09:26:50	t	t	f	\N
862	923	titouan	3	2016-12-19 13:10:08	\N	100	2016-12-19 22:20:28	2016-12-20 12:00:00	2016-12-20 00:15:49	t	t	t	\N
861	922	pro yo	2	2016-12-19 13:09:05	\N	56	2016-12-19 22:20:28	2016-12-20 12:00:00	2016-12-20 00:16:14	t	t	f	\N
847	920	tristan	\N	2016-12-17 19:48:19	\N	\N	2016-12-17 22:03:34	2016-12-18 12:00:00	\N	\N	\N	\N	\N
866	927	sonic bibou	3	2016-12-19 13:11:07	\N	100	2016-12-19 22:20:28	2016-12-20 12:00:00	2016-12-20 00:16:27	t	t	t	\N
841	917	Sonic Bibou	3	2016-12-17 19:45:09	\N	100	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-17 22:19:35	t	t	t	\N
846	919	p'tit denez	3	2016-12-17 19:47:59	\N	100	2016-12-18 12:00:00	2016-12-18 15:00:00	2016-12-17 22:19:46	t	t	t	\N
828	905	Gil2 latourette	3	2016-12-16 22:53:24	\N	100	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-17 22:43:43	t	t	t	\N
833	910	cogbzh	3	2016-12-16 22:55:18	\N	100	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-17 23:33:00	t	t	t	\N
831	908	ju	2	2016-12-16 22:54:34	\N	87	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-18 01:47:33	t	t	f	\N
849	909	Ju	\N	2016-12-18 01:47:42	\N	\N	2016-12-18 12:00:00	2016-12-18 15:00:00	\N	\N	\N	\N	\N
832	909	Cthulhu	1	2016-12-16 22:54:55	\N	87	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-18 07:59:20	t	f	f	\N
834	904	sanka	3	2016-12-17 15:58:32	\N	100	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-18 09:25:29	t	t	t	\N
850	909	cogbzh	\N	2016-12-18 09:59:55	\N	\N	2016-12-18 15:00:00	2016-12-18 18:00:00	\N	\N	\N	\N	\N
851	908	Cthulhu	3	2016-12-18 10:01:21	\N	\N	2016-12-18 10:01:22	2016-12-18 13:01:22	2016-12-18 10:01:36	f	f	t	\N
836	912	patt	2	2016-12-17 19:42:46	\N	86	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-18 11:01:40	t	t	f	\N
826	902	denez	2	2016-12-16 22:52:45	\N	70	2016-12-17 21:39:14	2016-12-18 12:00:00	2016-12-18 11:20:30	t	t	f	\N
882	927	Eric L'Ancien	2	2016-12-20 06:19:46	\N	99	2016-12-20 06:19:46	2016-12-20 09:19:46	2016-12-20 06:20:02	f	f	f	\N
852	901	denez	3	2016-12-18 11:20:42	\N	100	2016-12-18 11:20:42	2016-12-18 14:20:42	2016-12-18 12:51:39	f	f	t	\N
854	903	MiniCox7	3	2016-12-18 12:51:50	\N	100	2016-12-18 12:51:50	2016-12-18 15:51:50	2016-12-18 12:51:58	f	f	t	\N
855	911	Sergio	2	2016-12-18 12:53:03	\N	71	2016-12-18 12:53:04	2016-12-18 15:53:04	2016-12-18 12:53:20	t	t	f	\N
837	913	Sergio	2	2016-12-17 19:42:54	\N	80	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-18 12:53:34	t	t	f	\N
839	915	xubakka	2	2016-12-17 19:44:08	\N	54	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-18 12:53:52	t	t	f	\N
840	916	sylvain	3	2016-12-17 19:44:42	\N	100	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-18 12:54:07	t	t	t	\N
845	918	Chou	3	2016-12-17 19:47:46	\N	100	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-18 12:54:25	t	t	t	\N
838	914	...Diabolesse..	2	2016-12-17 19:43:21	\N	68	2016-12-17 22:03:34	2016-12-18 12:00:00	2016-12-18 13:38:22	t	t	f	\N
873	933	MiniCox7	2	2016-12-19 22:24:54	\N	58	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 06:54:36	t	t	f	\N
858	920	p'tit denez	3	2016-12-18 13:56:57	\N	100	2016-12-18 15:00:00	2016-12-18 18:00:00	2016-12-18 14:06:42	t	t	t	\N
856	915	...Diabolesse..	2	2016-12-18 13:43:26	\N	62	2016-12-18 13:43:26	2016-12-18 16:43:26	2016-12-18 14:53:26	f	f	f	\N
857	913	patt	2	2016-12-18 13:54:52	\N	72	2016-12-18 13:54:52	2016-12-18 16:54:52	2016-12-19 08:16:05	f	f	f	\N
860	914	xubakka	3	2016-12-19 08:17:43	\N	100	2016-12-19 08:17:43	2016-12-19 11:17:43	2016-12-19 08:17:51	f	f	t	\N
864	925	xubakka	\N	2016-12-19 13:10:48	\N	\N	2016-12-19 22:20:28	2016-12-20 12:00:00	\N	\N	\N	\N	\N
865	926	sylvain	\N	2016-12-19 13:10:57	\N	\N	2016-12-19 22:20:28	2016-12-20 12:00:00	\N	\N	\N	\N	\N
867	928	chou	\N	2016-12-19 13:11:38	\N	\N	2016-12-19 22:20:28	2016-12-20 12:00:00	\N	\N	\N	\N	\N
869	930	Eric l'ancien	\N	2016-12-19 13:12:10	\N	\N	2016-12-19 22:20:28	2016-12-20 12:00:00	\N	\N	\N	\N	\N
871	931	Norris	\N	2016-12-19 22:24:33	\N	\N	2016-12-19 22:49:04	2016-12-20 12:00:00	\N	\N	\N	\N	\N
868	929	p'tit denez	3	2016-12-19 13:11:55	\N	100	2016-12-19 22:20:28	2016-12-20 12:00:00	2016-12-19 22:37:26	t	t	t	\N
870	930	kheldar junior	3	2016-12-19 13:12:23	\N	100	2016-12-20 12:00:00	2016-12-20 15:00:00	2016-12-19 22:37:36	t	t	t	\N
875	935	neguess52	2	2016-12-19 22:25:20	\N	93	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-19 23:40:23	t	t	f	\N
880	940	tony25000	3	2016-12-19 22:26:13	\N	100	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 18:32:31	t	t	t	\N
872	932	Norris	2	2016-12-19 22:24:43	\N	\N	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 09:52:02	t	t	f	\N
876	936	helbrecht l	2	2016-12-19 22:25:33	\N	90	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 09:52:22	t	t	f	\N
877	937	Ju	2	2016-12-19 22:25:43	\N	90	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 09:58:52	t	t	f	\N
878	938	Cthulhu	3	2016-12-19 22:25:53	\N	\N	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 12:27:20	t	t	t	\N
885	940	Horizon	3	2016-12-20 13:03:33	\N	100	2016-12-20 12:00:00	2016-12-20 15:00:00	2016-12-20 13:03:40	t	t	t	\N
874	934	Rose	3	2016-12-19 22:25:07	\N	100	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 13:17:54	t	t	t	\N
886	931	MiniCox7	1	2016-12-20 13:18:10	\N	49	2016-12-20 12:00:00	2016-12-20 15:00:00	2016-12-20 13:18:31	t	f	f	\N
884	937	Cthulhu	3	2016-12-20 12:27:27	\N	100	2016-12-20 12:27:27	2016-12-20 15:27:27	2016-12-20 13:19:37	f	f	t	\N
879	939	DIAMOND DOG	3	2016-12-19 22:26:04	\N	100	2016-12-19 22:49:04	2016-12-20 12:00:00	2016-12-20 14:00:28	t	t	t	\N
863	924	marin	1	2016-12-19 13:10:19	\N	69	2016-12-19 22:20:28	2016-12-20 12:00:00	2016-12-20 15:53:47	t	f	f	\N
888	926	Eric L'Ancien	3	2016-12-20 13:39:13	\N	100	2016-12-20 15:00:00	2016-12-20 18:00:00	2016-12-20 16:05:05	t	t	t	\N
883	936	neguess52	3	2016-12-20 09:52:35	\N	100	2016-12-20 09:52:35	2016-12-20 12:52:35	2016-12-20 17:01:35	f	f	t	\N
889	939	tony25000	3	2016-12-20 17:46:52	\N	100	2016-12-20 17:46:53	2016-12-20 20:46:53	2016-12-20 17:47:03	f	f	f	\N
890	925	marin	\N	2016-12-20 18:22:51	\N	\N	2016-12-20 12:00:00	2016-12-20 15:00:00	\N	\N	\N	\N	\N
891	924	xubakka	2	2016-12-20 18:23:10	\N	91	2016-12-20 18:23:11	2016-12-20 21:23:11	2016-12-20 18:23:20	f	t	f	\N
892	938	DIAMOND DOG	3	2016-12-20 22:39:42	\N	100	2016-12-20 22:39:42	2016-12-21 01:39:42	2016-12-20 22:40:01	f	f	f	\N
894	957	Sergio	\N	2016-12-21 12:42:35	\N	\N	2016-12-21 21:36:57	2016-12-22 12:00:00	\N	\N	\N	\N	\N
902	965	Jouge56	\N	2016-12-21 12:44:47	\N	\N	2016-12-21 21:36:57	2016-12-22 12:00:00	\N	\N	\N	\N	\N
903	965	xubakka.jr	\N	2016-12-21 12:45:01	\N	\N	2016-12-22 12:00:00	2016-12-22 15:00:00	\N	\N	\N	\N	\N
913	951	ju	\N	2016-12-21 13:09:20	\N	\N	2016-12-21 22:15:38	2016-12-22 12:00:00	\N	\N	\N	\N	\N
911	949	Matiusalem	2	2016-12-21 13:08:53	\N	76	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 22:19:05	t	t	f	\N
905	943	MiniCox7	3	2016-12-21 13:07:04	\N	100	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 22:39:41	t	t	t	\N
917	955	bidou	3	2016-12-21 13:10:10	\N	100	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 22:40:35	t	t	t	\N
918	962	Chou	\N	2016-12-21 22:59:23	\N	\N	2016-12-22 12:00:00	2016-12-22 15:00:00	\N	\N	\N	\N	\N
916	954	tony25000	3	2016-12-21 13:09:54	\N	100	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:11:11	t	t	t	\N
908	946	cox7	2	2016-12-21 13:08:08	\N	64	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:30:25	t	t	f	\N
900	963	Eric L'Ancien	3	2016-12-21 12:44:00	\N	100	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-21 23:30:47	t	t	t	\N
910	948	kobeight	3	2016-12-21 13:08:32	\N	100	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:31:38	t	t	t	\N
912	950	neguess52	2	2016-12-21 13:09:11	\N	80	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:53:53	t	t	f	\N
919	951	Matiusalem	3	2016-12-21 23:25:47	\N	100	2016-12-22 12:00:00	2016-12-22 15:00:00	2016-12-22 07:16:25	t	t	t	\N
904	942	frere norris	2	2016-12-21 13:06:55	\N	59	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-22 09:33:04	t	t	f	\N
909	947	jibe79	2	2016-12-21 13:08:17	\N	55	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-22 10:48:55	t	t	f	\N
899	962	LiaFarey	1	2016-12-21 12:43:48	\N	86	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-22 12:17:08	t	f	f	\N
898	961	chou	3	2016-12-21 12:43:09	\N	100	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-22 12:17:18	t	t	t	\N
896	959	sylvain	3	2016-12-21 12:42:55	\N	100	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-22 12:17:58	t	t	t	\N
895	958	titouanjanis	2	2016-12-21 12:42:45	\N	85	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-22 12:18:09	t	t	f	\N
906	944	JouGe.56	2	2016-12-21 13:07:11	\N	63	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:29:52	t	t	f	\N
914	952	Cthulhu	2	2016-12-21 13:09:36	\N	75	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:31:03	t	t	f	\N
915	953	DIAMOND DOG	3	2016-12-21 13:09:44	\N	100	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-21 23:56:45	t	t	t	\N
920	952	DIAMOND DOG	3	2016-12-22 01:05:27	\N	100	2016-12-22 01:05:27	2016-12-22 04:05:27	2016-12-22 01:05:42	f	f	t	\N
922	949	kobeight	3	2016-12-22 09:32:53	\N	100	2016-12-22 09:32:53	2016-12-22 12:32:53	2016-12-22 09:32:58	f	f	t	\N
901	964	kheldar.jr	3	2016-12-21 12:44:37	\N	100	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-22 12:16:36	t	t	t	\N
897	960	Sonic Bibou	3	2016-12-21 12:43:03	\N	100	2016-12-21 21:36:57	2016-12-22 12:00:00	2016-12-22 12:17:43	t	t	t	\N
925	965	kheldar.jr	3	2016-12-22 12:18:33	\N	100	2016-12-22 15:00:00	2016-12-22 18:00:00	2016-12-22 12:22:20	t	t	t	\N
923	950	jibe79	3	2016-12-22 10:49:23	\N	100	2016-12-22 10:49:23	2016-12-22 13:49:23	2016-12-22 12:22:38	f	f	t	\N
924	947	neguess52	3	2016-12-22 11:10:26	\N	100	2016-12-22 11:10:26	2016-12-22 14:10:26	2016-12-22 12:26:14	f	f	t	\N
926	962	Sonic Bibou	\N	2016-12-22 12:33:47	\N	\N	2016-12-22 18:00:00	2016-12-22 21:00:00	\N	\N	\N	\N	\N
921	962	Eric L'Ancien	1	2016-12-22 02:18:53	\N	54	2016-12-22 15:00:00	2016-12-22 18:00:00	2016-12-22 12:41:33	t	f	f	\N
927	946	JouGe.56	1	2016-12-22 12:56:17	\N	98	2016-12-22 12:56:17	2016-12-22 15:56:17	2016-12-22 13:03:47	f	f	f	\N
907	945	simon	2	2016-12-21 13:07:50	\N	60	2016-12-21 22:15:38	2016-12-22 12:00:00	2016-12-22 13:54:18	t	t	f	\N
929	952	tony25000	3	2016-12-22 17:44:10	\N	100	2016-12-22 17:44:10	2016-12-22 20:44:10	2016-12-22 17:44:22	f	f	f	\N
933	970	Tony Du 56	\N	2016-12-23 08:55:13	\N	\N	2016-12-23 22:44:56	2016-12-24 12:00:00	\N	\N	\N	\N	\N
939	975	calamityjanis	\N	2016-12-23 08:56:48	\N	\N	2016-12-24 12:00:00	2016-12-24 15:00:00	\N	\N	\N	\N	\N
936	973	Eric L'Ancien	3	2016-12-23 08:55:45	\N	100	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-23 23:37:42	t	t	t	\N
934	971	sylvain	2	2016-12-23 08:55:22	\N	90	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 09:40:51	t	t	f	\N
935	972	Sonic Bibou	1	2016-12-23 08:55:34	\N	64	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 09:41:36	t	f	f	\N
930	967	pro yo	3	2016-12-23 08:54:31	\N	100	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 09:42:13	t	t	t	\N
938	975	kheldar.jr	3	2016-12-23 08:56:37	\N	100	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 09:43:04	t	t	t	\N
937	974	tristan	3	2016-12-23 08:56:22	\N	100	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 09:43:18	t	t	t	\N
932	969	jule	3	2016-12-23 08:55:04	\N	100	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 10:34:27	t	t	t	\N
940	972	Eric L'Ancien	0	2016-12-24 07:14:32	\N	37	2016-12-24 12:00:00	2016-12-24 15:00:00	2016-12-24 14:25:10	f	f	f	\N
931	968	juleswarz	2	2016-12-23 08:54:41	\N	\N	2016-12-23 22:44:56	2016-12-24 12:00:00	2016-12-24 16:01:00	t	t	f	\N
941	971	juleswarz	\N	2016-12-24 16:01:29	\N	\N	2016-12-24 16:01:29	2016-12-24 19:01:29	\N	\N	\N	\N	\N
950	984	borgorel	\N	2016-12-29 21:19:06	\N	\N	2016-12-29 21:19:06	2016-12-30 00:19:06	\N	\N	\N	\N	\N
946	980	JouGe.56	2	2016-12-29 21:17:14	\N	59	2016-12-29 21:17:14	2016-12-30 00:17:15	2016-12-29 22:55:48	t	t	f	\N
947	981	rrhorrr dkvern	1	2016-12-29 21:17:57	\N	81	2016-12-29 21:17:57	2016-12-30 00:17:57	2016-12-29 22:56:06	t	f	f	\N
949	983	Gil2 latourette	3	2016-12-29 21:18:33	\N	100	2016-12-29 21:18:33	2016-12-30 00:18:33	2016-12-29 22:56:18	t	t	t	\N
951	985	neguess52	3	2016-12-29 21:19:17	\N	100	2016-12-29 21:19:17	2016-12-30 00:19:17	2016-12-29 23:06:38	t	t	t	\N
942	977	frere norris	2	2016-12-29 21:16:05	\N	52	2016-12-29 21:16:05	2016-12-30 00:16:05	2016-12-30 11:44:24	t	t	f	\N
945	979	♠️AcE♠️	2	2016-12-29 21:16:59	\N	63	2016-12-29 21:17:00	2016-12-30 00:17:00	2016-12-30 11:51:10	t	t	f	\N
952	984	neguess52	2	2016-12-30 11:54:57	\N	85	2016-12-30 00:19:06	2016-12-30 03:19:06	2016-12-30 12:41:03	t	t	f	\N
944	978	denez	3	2016-12-29 21:16:46	\N	100	2016-12-29 21:16:46	2016-12-30 00:16:46	2016-12-30 12:58:18	t	t	t	\N
948	982	King PHE	2	2016-12-29 21:18:21	\N	70	2016-12-29 21:18:21	2016-12-30 00:18:21	2016-12-30 17:42:36	t	t	f	\N
960	981	denez	\N	2016-12-30 20:20:23	\N	\N	2016-12-30 20:20:23	2016-12-30 23:20:23	\N	\N	\N	\N	\N
953	981	Gil2 latourette	2	2016-12-30 15:25:41	\N	67	2016-12-30 15:25:41	2016-12-30 18:25:41	2016-12-30 17:47:34	f	t	f	\N
955	982	JouGe.56	2	2016-12-30 17:50:07	\N	96	2016-12-30 17:50:07	2016-12-30 20:50:07	2016-12-30 18:05:17	f	f	f	\N
958	984	Rhoorrrr	3	2016-12-30 18:04:12	\N	100	2016-12-31 00:04:11	2016-12-31 03:04:11	2016-12-30 18:28:11	t	t	t	\N
959	982	♠️AcE♠️	3	2016-12-30 19:23:35	\N	100	2016-12-30 19:23:35	2016-12-30 22:23:35	2016-12-30 20:20:34	f	f	t	\N
961	976	frere norris	2	2016-12-30 20:20:47	\N	63	2016-12-30 20:20:47	2016-12-30 23:20:47	2016-12-30 20:20:55	t	t	f	\N
984	1010	Eric l'ancien	3	2017-01-03 09:21:21	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:03:49	t	t	t	\N
963	989	JouGe.56	2	2017-01-03 09:16:54	\N	78	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:06:18	t	t	f	\N
968	994	fulcrum	2	2017-01-03 09:17:57	\N	89	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:09:49	t	t	f	\N
981	1007	Sonic Bibou	1	2017-01-03 09:20:35	\N	87	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:13:59	t	f	f	\N
965	991	patt	3	2017-01-03 09:17:19	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:13:06	t	t	t	\N
970	996	jibe79	3	2017-01-03 09:18:24	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:19:41	t	t	t	\N
983	1009	Eric L'ancien	3	2017-01-03 09:21:06	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:29:52	t	t	t	\N
975	1001	neguess52	1	2017-01-03 09:19:19	\N	94	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 22:37:25	t	f	f	\N
982	1008	cogbzh	1	2017-01-03 09:20:46	\N	74	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-03 23:28:14	t	f	f	\N
969	995	Diabolesse	2	2017-01-03 09:18:15	\N	91	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 00:08:40	t	t	f	\N
962	988	frere norris	2	2017-01-03 09:16:44	\N	\N	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 08:41:07	t	t	f	\N
967	993	Gil2 latourette	3	2017-01-03 09:17:40	\N	\N	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 08:41:30	t	t	t	\N
974	1000	Matiusalem	2	2017-01-03 09:19:09	\N	\N	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 08:41:50	t	t	f	\N
978	1004	mikke	3	2017-01-03 09:20:01	\N	\N	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 08:42:10	t	t	t	\N
979	1005	jac91	3	2017-01-03 09:20:13	\N	\N	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 08:42:31	t	t	t	\N
976	1002	sylvain	3	2017-01-03 09:19:31	\N	\N	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 08:46:56	t	t	t	\N
980	1006	Gus	3	2017-01-03 09:20:25	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 09:28:43	t	t	t	\N
964	990	flo	2	2017-01-03 09:17:09	\N	74	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 10:36:59	t	t	f	\N
973	999	Marin	2	2017-01-03 09:18:58	\N	94	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 11:20:48	t	t	f	\N
971	997	tristan	3	2017-01-03 09:18:33	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 12:21:09	t	t	t	\N
977	1003	helbrecht l	3	2017-01-03 09:19:43	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 14:17:44	t	t	t	\N
966	992	sergio	2	2017-01-03 09:17:29	\N	55	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 14:25:36	t	t	f	\N
994	1007	tristan	2	2017-01-04 14:54:38	\N	72	2017-01-04 14:54:38	2017-01-04 17:54:38	2017-01-04 15:01:55	f	t	f	\N
991	995	fulcrum	3	2017-01-04 14:20:19	\N	100	2017-01-04 14:20:20	2017-01-04 17:20:20	2017-01-04 15:14:20	f	f	t	\N
996	1008	mikke	3	2017-01-04 15:15:15	\N	100	2017-01-04 15:15:15	2017-01-04 18:15:15	2017-01-04 15:15:30	f	t	t	\N
989	987	JouGe.56	2	2017-01-04 12:27:40	\N	61	2017-01-04 12:27:40	2017-01-04 15:27:40	2017-01-04 15:20:48	t	t	f	\N
995	1000	tristan	3	2017-01-04 14:56:50	\N	100	2017-01-04 14:56:51	2017-01-04 17:56:51	2017-01-04 15:23:34	f	f	t	\N
972	998	titouanjanis	3	2017-01-03 09:18:45	\N	100	2017-01-03 21:48:07	2017-01-04 12:00:00	2017-01-04 18:43:23	t	t	t	\N
988	1001	jac91	2	2017-01-04 11:23:49	\N	81	2017-01-04 11:23:49	2017-01-04 14:23:49	2017-01-04 19:09:46	f	t	f	\N
990	986	frere norris	2	2017-01-04 12:27:54	\N	52	2017-01-04 12:27:54	2017-01-04 15:27:54	2017-01-05 09:24:17	t	t	f	\N
1000	1007	cogbzh	3	2017-01-04 18:30:09	\N	\N	2017-01-04 18:28:28	2017-01-04 21:28:28	2017-01-04 18:46:51	f	f	t	\N
998	999	neguess52	3	2017-01-04 16:30:27	\N	\N	2017-01-04 16:30:27	2017-01-04 19:30:27	2017-01-04 18:52:20	f	f	t	\N
993	992	patt	2	2017-01-04 14:25:44	\N	81	2017-01-04 14:25:44	2017-01-04 17:25:44	2017-01-04 19:05:51	f	f	f	\N
1004	1001	marin	3	2017-01-04 19:00:08	\N	100	2017-01-04 17:23:49	2017-01-04 20:23:49	2017-01-04 19:09:51	f	f	t	\N
1006	994	Gus	1	2017-01-04 19:37:57	\N	60	2017-01-04 21:59:22	2017-01-05 00:59:22	2017-01-04 19:59:31	f	f	f	\N
1003	994	helbrecht l	1	2017-01-04 18:59:22	\N	82	2017-01-04 18:59:22	2017-01-04 21:59:22	2017-01-04 20:54:02	f	f	f	\N
1007	994	jibe79	1	2017-01-04 19:59:36	\N	82	2017-01-04 19:59:36	2017-01-04 22:59:36	2017-01-04 20:54:21	f	f	f	\N
1009	994	flo	3	2017-01-05 09:24:55	\N	100	2017-01-05 09:24:55	2017-01-05 12:24:55	2017-01-05 09:25:11	f	f	t	\N
1008	992	GIL	1	2017-01-04 20:53:38	\N	63	2017-01-04 20:53:38	2017-01-04 23:53:38	2017-01-05 09:53:17	f	f	f	\N
1010	1011	frere norris	\N	2017-01-05 11:02:31	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1011	1012	denez	\N	2017-01-05 11:02:50	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1012	1013	JouGe.56	\N	2017-01-05 11:03:01	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1013	1014	flo	\N	2017-01-05 11:03:22	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1014	1015	Super VegeDave	\N	2017-01-05 11:03:42	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1015	1016	calimero	\N	2017-01-05 11:04:10	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1016	1017	patt	\N	2017-01-05 11:04:20	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1017	1018	King PHE	\N	2017-01-05 11:04:42	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1018	1019	Sergio	\N	2017-01-05 11:04:54	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1019	1020	Gil2 latourette	\N	2017-01-05 11:05:27	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1020	1021	...Diabolesse...	\N	2017-01-05 11:06:03	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1021	1022	jibe79	\N	2017-01-05 11:06:21	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1022	1023	PaPa PeUch	\N	2017-01-05 11:07:04	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1023	1024	tristan	\N	2017-01-05 11:07:22	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1024	1025	KiKi Le PiRatE	\N	2017-01-05 11:10:26	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1025	1026	titouanjanis	\N	2017-01-05 11:10:46	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1026	1027	Marin	\N	2017-01-05 11:11:06	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1027	1028	juleswarz	\N	2017-01-05 11:11:33	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1028	1029	jule	\N	2017-01-05 11:11:50	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1029	1030	anael	\N	2017-01-05 11:12:04	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1030	1031	xubakka	\N	2017-01-05 11:12:26	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1031	1032	Evan	\N	2017-01-05 11:12:40	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1032	1033	Matiusalem	\N	2017-01-05 11:13:12	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1033	1034	neguess52	\N	2017-01-05 11:13:26	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1034	1035	sylvain	\N	2017-01-05 11:13:48	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1035	1036	helbrecht l	\N	2017-01-05 11:14:19	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1036	1037	XERCES	\N	2017-01-05 11:14:36	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1037	1038	mikke	\N	2017-01-05 11:14:50	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1038	1039	jac91	\N	2017-01-05 11:15:07	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1039	1040	Gus	\N	2017-01-05 11:15:22	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1040	1041	ju	\N	2017-01-05 11:15:39	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1041	1042	DIAMOND DOG	\N	2017-01-05 11:16:00	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1042	1043	Sonic Bibou	\N	2017-01-05 11:16:13	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1043	1044	cogbzh	\N	2017-01-05 11:16:32	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1044	1045	Ferrara	\N	2017-01-05 11:16:56	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1048	1049	tristan	\N	2017-01-05 11:18:31	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1049	1046	Eric L'Ancien	\N	2017-01-05 11:19:28	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1050	1047	p'tit denez	\N	2017-01-05 11:19:39	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1051	1048	bidou	\N	2017-01-05 11:19:51	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1052	1050	kheldar-junior	\N	2017-01-05 11:20:18	\N	\N	2017-01-05 22:58:10	2017-01-06 12:00:00	\N	\N	\N	\N	\N
1055	1011	calimero	\N	2017-01-05 19:43:41	\N	\N	2017-01-06 12:00:00	2017-01-06 15:00:00	\N	\N	\N	\N	\N
\.


--
-- Name: attack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('attack_id_seq', 1055, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY categories (id, root_id, parent_id, title, lft, lvl, rgt) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: clan; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY clan (id, name, slug, level, description, timer, date_creation, date_maj, type, tag) FROM stdin;
10	Dell Mazoo	dell-mazoo	10	\N	\N	2016-08-30 10:24:51	\N	2	#P22L88V9
11	cf	cf	1	\N	\N	2016-08-30 22:28:05	\N	2	fg
16	test	test	9	\N	\N	2016-09-07 18:37:30	\N	2	yrsff
17	Test	test-1	3	\N	\N	2016-09-07 18:44:37	\N	2	#U2Y08GU
18	Test	test-2	3	\N	\N	2016-09-07 19:00:37	\N	2	#U2Y08GU
19	test	test-3	10	\N	\N	2016-11-10 12:06:43	\N	2	test
20	test	test-4	1	\N	\N	2016-11-10 14:43:41	\N	2	test
26	El salvador war	el-salvador-war-1	10	\N	\N	2016-11-15 21:31:15	\N	2	#P2UYQVOV
28	Apocaslype	apocaslype	8	\N	\N	2016-11-16 22:58:25	\N	2	#2345
21	cal of the dead	cal-of-the-dead	9	\N	\N	2016-11-11 09:45:29	\N	2	#8LCCVY9C
29	ITALIANSWAY	italiansway	10	\N	\N	2016-11-17 07:24:47	\N	2	#28VVVORR
22	Test	test-5	10	\N	\N	2016-11-11 13:18:04	\N	2	Test
23	IRAN*ROYAL*Team	iran-royal-team	11	\N	\N	2016-11-13 09:24:10	\N	2	#9GRLVLLR
24	MADRAS PASANGA	madras-pasanga	9	\N	\N	2016-11-14 15:10:51	\N	2	#90Q0Q0Q2
25	El Salvador War	el-salvador-war	10	\N	\N	2016-11-15 10:33:43	\N	2	#P2UYQVOV
30	Danske vikinger	danske-vikinger	9	\N	\N	2016-11-19 12:47:45	\N	2	.
33	vikings 76	vikings-76	9	\N	\N	2016-11-19 15:37:40	\N	2	# 3456
34	Ogc	ogc	10	\N	\N	2016-11-21 08:51:39	\N	2	Bonne gdc
35	Garbit	garbit	8	\N	\N	2016-11-21 12:42:58	\N	2	# 1234
36	werepoodls	werepoodls	7	\N	\N	2016-11-23 08:55:09	\N	2	Germany
37	Couscous Merguez	couscous-merguez	10	\N	\N	2016-11-23 16:10:13	\N	2	P98QLJ80
39	les tchou tchou	les-tchou-tchou	8	\N	\N	2016-11-25 00:25:59	\N	2	# 1234
40	RevoltingBlob	revoltingblob	11	\N	\N	2016-11-25 14:55:52	\N	2	QGPR89U
41	Argentrucha	argentrucha	2	\N	\N	2016-11-26 22:58:39	\N	2	#r80cqvru
42	Tropnaz	tropnaz	8	\N	\N	2016-11-27 00:05:58	\N	2	# 1234
43	bulgarche	bulgarche	10	\N	\N	2016-11-29 09:23:11	\N	2	#20v88qpc
44	Garbit	garbit-1	7	\N	\N	2016-11-29 09:52:53	\N	2	#1234
45	israeli wizards	israeli-wizards	8	\N	\N	2016-11-30 23:03:52	\N	2	#yujpljj9
46	Alpha.R	alpha-r	9	\N	\N	2016-12-01 11:44:08	\N	2	#1234
9	Skol Clash Bzh	skol-clash-bzh	6	<p style="text-align: center;"><strong>Votre cible pour votre 1&egrave;re attaque vous est attribu&eacute;e.</strong></p>\r\n\r\n<p style="text-align: center;">Apr&eacute;s votre attaque notez votre score en cliquant sur le timer sous votre pseudo.</p>\r\n\r\n<p style="text-align: center;">Le timer de la <strong>premi&egrave;re attaque est valide jusqu&#39;&agrave; MIDI</strong> ! Les timers pour les attaques suivantes sont de 3h.</p>\r\n\r\n<p style="text-align: center;">R&eacute;servez votre 2&egrave;me attaque avec le bouton + (choisissez une cible o&ugrave; vous &ecirc;tes en mesure de faire 3 &eacute;toiles, on ne pense pas butin !!!)</p>\r\n\r\n<p style="text-align: center;"><strong>Plus on est bas, plus on fait ses attaques rapidement</strong> (&agrave; l&#39;inverse le haut garde une attaque pour la fin si possible)</p>\r\n\r\n<p style="text-align: center;">Bon clash et soyez rigoureux, si vous faites n&#39;importe quoi c&#39;est tout le clan qui perd..</p>	3	2016-08-30 10:24:51	\N	1	#9QPYC90P
49	Persian Gulf	persian-gulf	5	\N	\N	2016-12-02 22:49:40	\N	2	#  1234
58	Wolperdinga	wolperdinga	5	\N	\N	2016-12-09 15:10:21	\N	2	#1234
59	vlaams	vlaams	10	\N	\N	2016-12-09 19:09:24	\N	2	#82Q9LVPL
67	Persian titaz	persian-titaz	10	\N	\N	2016-12-11 17:25:25	\N	2	Bonne gdc
48	Persian family	persian-family	9	\N	\N	2016-12-02 22:49:34	\N	2	#2LJUUJLO
68	Timmy Soldiers	timmy-soldiers	5	\N	\N	2016-12-11 19:41:21	\N	2	#1234
50	"imprononçable"	imprononcable	8	\N	\N	2016-12-05 08:06:31	\N	2	#92909qpr
51	Garbit	garbit-2	8	\N	\N	2016-12-05 19:20:46	\N	2	#1234
52	#PVJJ8R9Y	pvjj8r9y	8	\N	\N	2016-12-05 19:21:25	\N	2	#PVJJ8R9Y
69	Vincetheprince	vincetheprince	8	\N	\N	2016-12-13 11:49:11	\N	2	#1234
56	IRAN	iran	11	\N	\N	2016-12-07 19:08:06	\N	2	#8JQ9OQOG
57	Pandora	pandora	5	\N	\N	2016-12-07 19:29:01	\N	2	#LQLCY9CU
70	Vincetheprince	vincetheprince-1	8	\N	\N	2016-12-13 11:49:13	\N	2	#1234
71	GREEK ARMY	greek-army	7	\N	\N	2016-12-13 12:24:45	\N	2	9UV89YYU
72	Tehran	tehran	7	\N	\N	2016-12-15 10:42:01	\N	2	#1234
73	aszok	aszok	8	\N	\N	2016-12-15 12:55:10	\N	2	#20v88qpc
74	syria-hama	syria-hama	9	\N	\N	2016-12-16 22:52:14	\N	2	#20v88qpc
75	Dansk	dansk	7	\N	\N	2016-12-17 19:42:34	\N	2	#1234
76	Garbit	garbit-3	7	\N	\N	2016-12-19 13:08:28	\N	2	#1234
77	Xuki	xuki	9	\N	\N	2016-12-19 22:24:04	\N	2	Bonne gdc
78	Uniek NL united	uniek-nl-united	10	\N	\N	2016-12-21 10:56:38	\N	2	#9JVCOYYR
79	Serval	serval	10	\N	\N	2016-12-21 12:41:57	\N	2	#1234
80	Chausseeete	chausseeete	9	\N	\N	2016-12-23 08:53:56	\N	2	#1234
81	Tijolonalata	tijolonalata	8	\N	\N	2016-12-29 07:51:27	\N	2	Bonne gdc
82	BRCM	brcm	12	\N	\N	2017-01-03 08:55:05	\N	2	JU9JCPY
83	ANDIMESHK CITY	andimeshk-city	12	\N	\N	2017-01-05 09:39:10	\N	2	#9ROCRRLU
8	clash bzh	clash-bzh	9	<p style="text-align:center"><span style="color:#ff0000"><strong>Votre cible pour votre 1&egrave;re attaque vous est attribu&eacute;e.</strong></span></p>\r\n\r\n<p style="text-align:center">Apr&eacute;s votre attaque notez votre score en cliquant sur le timer sous votre pseudo.</p>\r\n\r\n<p style="text-align:center">Le timer de la <span style="color:#ff0000"><strong>premi&egrave;re attaque est valide jusqu&#39;&agrave; MIDI</strong></span> ! Les timers pour les attaques suivantes sont de 3h.</p>\r\n\r\n<p style="text-align:center">R&eacute;servez votre 2&egrave;me attaque avec le bouton + vert (choisissez une cible o&ugrave; vous &ecirc;tes en mesure de faire 3 &eacute;toiles, on ne pense pas butin !!!)</p>\r\n\r\n<p style="text-align:center"><span style="color:#ff0000"><strong>Plus on est bas, plus on fait ses attaques rapidement</strong></span> (&agrave; l&#39;inverse le haut garde une attaque pour la fin si possible)</p>\r\n\r\n<p style="text-align:center">Bon clash et soyez rigoureux, si vous faites n&#39;importe quoi c&#39;est tout le clan qui perd...</p>\r\n\r\n<p style="text-align:center">&nbsp;</p>\r\n\r\n<p style="text-align:center"><span style="color:#ff0000"><strong><span style="font-size:14px">N&#39;h&eacute;sitez pas &agrave; vous arranger entre joueurs concern&eacute;s pour &eacute;changer les cibles. Chaque &eacute;toile est importante</span></strong></span></p>	3	2016-08-30 10:24:51	\N	1	#2GL2GPC9
84	sqdfqsdfqsfd	sqdfqsdfqsfd	27	\N	\N	2017-01-05 14:41:31	\N	2	sqdfqsdfqsdf
\.


--
-- Name: clan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('clan_id_seq', 84, true);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY image (id, url, alt) FROM stdin;
6	png	Screenshot_2016-11-16-09-30-39.png
\.


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('image_id_seq', 6, true);


--
-- Data for Name: phpbb_acl_groups; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_acl_groups (group_id, forum_id, auth_option_id, auth_role_id, auth_setting) FROM stdin;
1	0	89	0	1
1	0	98	0	1
1	0	116	0	1
5	0	0	5	0
5	0	0	1	0
2	0	0	6	0
3	0	0	6	0
4	0	0	5	0
4	0	0	10	0
1	1	0	17	0
2	1	0	17	0
3	1	0	17	0
6	1	0	17	0
1	2	0	17	0
2	2	0	15	0
3	2	0	15	0
4	2	0	21	0
5	2	0	14	0
5	2	0	10	0
6	2	0	19	0
7	0	0	23	0
7	1	0	15	0
7	2	0	15	0
\.


--
-- Data for Name: phpbb_acl_options; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_acl_options (auth_option_id, auth_option, is_global, is_local, founder_only) FROM stdin;
1	f_	0	1	0
2	f_announce	0	1	0
3	f_attach	0	1	0
4	f_bbcode	0	1	0
5	f_bump	0	1	0
6	f_delete	0	1	0
7	f_download	0	1	0
8	f_edit	0	1	0
9	f_email	0	1	0
10	f_flash	0	1	0
11	f_icons	0	1	0
12	f_ignoreflood	0	1	0
13	f_img	0	1	0
14	f_list	0	1	0
15	f_noapprove	0	1	0
16	f_poll	0	1	0
17	f_post	0	1	0
18	f_postcount	0	1	0
19	f_print	0	1	0
20	f_read	0	1	0
21	f_reply	0	1	0
22	f_report	0	1	0
23	f_search	0	1	0
24	f_sigs	0	1	0
25	f_smilies	0	1	0
26	f_sticky	0	1	0
27	f_subscribe	0	1	0
28	f_user_lock	0	1	0
29	f_vote	0	1	0
30	f_votechg	0	1	0
31	f_softdelete	0	1	0
32	m_	1	1	0
33	m_approve	1	1	0
34	m_chgposter	1	1	0
35	m_delete	1	1	0
36	m_edit	1	1	0
37	m_info	1	1	0
38	m_lock	1	1	0
39	m_merge	1	1	0
40	m_move	1	1	0
41	m_report	1	1	0
42	m_split	1	1	0
43	m_softdelete	1	1	0
44	m_ban	1	0	0
45	m_pm_report	1	0	0
46	m_warn	1	0	0
47	a_	1	0	0
48	a_aauth	1	0	0
49	a_attach	1	0	0
50	a_authgroups	1	0	0
51	a_authusers	1	0	0
52	a_backup	1	0	0
53	a_ban	1	0	0
54	a_bbcode	1	0	0
55	a_board	1	0	0
56	a_bots	1	0	0
57	a_clearlogs	1	0	0
58	a_email	1	0	0
59	a_extensions	1	0	0
60	a_fauth	1	0	0
61	a_forum	1	0	0
62	a_forumadd	1	0	0
63	a_forumdel	1	0	0
64	a_group	1	0	0
65	a_groupadd	1	0	0
66	a_groupdel	1	0	0
67	a_icons	1	0	0
68	a_jabber	1	0	0
69	a_language	1	0	0
70	a_mauth	1	0	0
71	a_modules	1	0	0
72	a_names	1	0	0
73	a_phpinfo	1	0	0
74	a_profile	1	0	0
75	a_prune	1	0	0
76	a_ranks	1	0	0
77	a_reasons	1	0	0
78	a_roles	1	0	0
79	a_search	1	0	0
80	a_server	1	0	0
81	a_styles	1	0	0
82	a_switchperm	1	0	0
83	a_uauth	1	0	0
84	a_user	1	0	0
85	a_userdel	1	0	0
86	a_viewauth	1	0	0
87	a_viewlogs	1	0	0
88	a_words	1	0	0
89	u_	1	0	0
90	u_attach	1	0	0
91	u_chgavatar	1	0	0
92	u_chgcensors	1	0	0
93	u_chgemail	1	0	0
94	u_chggrp	1	0	0
95	u_chgname	1	0	0
96	u_chgpasswd	1	0	0
97	u_chgprofileinfo	1	0	0
98	u_download	1	0	0
99	u_hideonline	1	0	0
100	u_ignoreflood	1	0	0
101	u_masspm	1	0	0
102	u_masspm_group	1	0	0
103	u_pm_attach	1	0	0
104	u_pm_bbcode	1	0	0
105	u_pm_delete	1	0	0
106	u_pm_download	1	0	0
107	u_pm_edit	1	0	0
108	u_pm_emailpm	1	0	0
109	u_pm_flash	1	0	0
110	u_pm_forward	1	0	0
111	u_pm_img	1	0	0
112	u_pm_printpm	1	0	0
113	u_pm_smilies	1	0	0
114	u_readpm	1	0	0
115	u_savedrafts	1	0	0
116	u_search	1	0	0
117	u_sendemail	1	0	0
118	u_sendim	1	0	0
119	u_sendpm	1	0	0
120	u_sig	1	0	0
121	u_viewonline	1	0	0
122	u_viewprofile	1	0	0
\.


--
-- Name: phpbb_acl_options_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_acl_options_seq', 122, true);


--
-- Data for Name: phpbb_acl_roles; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_acl_roles (role_id, role_name, role_description, role_type, role_order) FROM stdin;
1	ROLE_ADMIN_STANDARD	ROLE_DESCRIPTION_ADMIN_STANDARD	a_	1
2	ROLE_ADMIN_FORUM	ROLE_DESCRIPTION_ADMIN_FORUM	a_	3
3	ROLE_ADMIN_USERGROUP	ROLE_DESCRIPTION_ADMIN_USERGROUP	a_	4
4	ROLE_ADMIN_FULL	ROLE_DESCRIPTION_ADMIN_FULL	a_	2
5	ROLE_USER_FULL	ROLE_DESCRIPTION_USER_FULL	u_	3
6	ROLE_USER_STANDARD	ROLE_DESCRIPTION_USER_STANDARD	u_	1
7	ROLE_USER_LIMITED	ROLE_DESCRIPTION_USER_LIMITED	u_	2
8	ROLE_USER_NOPM	ROLE_DESCRIPTION_USER_NOPM	u_	4
9	ROLE_USER_NOAVATAR	ROLE_DESCRIPTION_USER_NOAVATAR	u_	5
10	ROLE_MOD_FULL	ROLE_DESCRIPTION_MOD_FULL	m_	3
11	ROLE_MOD_STANDARD	ROLE_DESCRIPTION_MOD_STANDARD	m_	1
12	ROLE_MOD_SIMPLE	ROLE_DESCRIPTION_MOD_SIMPLE	m_	2
13	ROLE_MOD_QUEUE	ROLE_DESCRIPTION_MOD_QUEUE	m_	4
14	ROLE_FORUM_FULL	ROLE_DESCRIPTION_FORUM_FULL	f_	7
15	ROLE_FORUM_STANDARD	ROLE_DESCRIPTION_FORUM_STANDARD	f_	5
16	ROLE_FORUM_NOACCESS	ROLE_DESCRIPTION_FORUM_NOACCESS	f_	1
17	ROLE_FORUM_READONLY	ROLE_DESCRIPTION_FORUM_READONLY	f_	2
18	ROLE_FORUM_LIMITED	ROLE_DESCRIPTION_FORUM_LIMITED	f_	3
19	ROLE_FORUM_BOT	ROLE_DESCRIPTION_FORUM_BOT	f_	9
20	ROLE_FORUM_ONQUEUE	ROLE_DESCRIPTION_FORUM_ONQUEUE	f_	8
21	ROLE_FORUM_POLLS	ROLE_DESCRIPTION_FORUM_POLLS	f_	6
22	ROLE_FORUM_LIMITED_POLLS	ROLE_DESCRIPTION_FORUM_LIMITED_POLLS	f_	4
23	ROLE_USER_NEW_MEMBER	ROLE_DESCRIPTION_USER_NEW_MEMBER	u_	6
24	ROLE_FORUM_NEW_MEMBER	ROLE_DESCRIPTION_FORUM_NEW_MEMBER	f_	10
\.


--
-- Data for Name: phpbb_acl_roles_data; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_acl_roles_data (role_id, auth_option_id, auth_setting) FROM stdin;
1	47	1
1	49	1
1	50	1
1	51	1
1	53	1
1	54	1
1	55	1
1	59	1
1	60	1
1	61	1
1	62	1
1	63	1
1	64	1
1	65	1
1	66	1
1	67	1
1	70	1
1	72	1
1	74	1
1	75	1
1	76	1
1	77	1
1	83	1
1	84	1
1	85	1
1	86	1
1	87	1
1	88	1
2	47	1
2	50	1
2	51	1
2	60	1
2	61	1
2	62	1
2	63	1
2	70	1
2	75	1
2	83	1
2	86	1
2	87	1
3	47	1
3	50	1
3	51	1
3	53	1
3	64	1
3	65	1
3	66	1
3	76	1
3	83	1
3	84	1
3	86	1
3	87	1
4	47	1
4	48	1
4	49	1
4	50	1
4	51	1
4	52	1
4	53	1
4	54	1
4	55	1
4	56	1
4	57	1
4	58	1
4	59	1
4	60	1
4	61	1
4	62	1
4	63	1
4	64	1
4	65	1
4	66	1
4	67	1
4	68	1
4	69	1
4	70	1
4	71	1
4	72	1
4	73	1
4	74	1
4	75	1
4	76	1
4	77	1
4	78	1
4	79	1
4	80	1
4	81	1
4	82	1
4	83	1
4	84	1
4	85	1
4	86	1
4	87	1
4	88	1
5	89	1
5	90	1
5	91	1
5	92	1
5	93	1
5	94	1
5	95	1
5	96	1
5	97	1
5	98	1
5	99	1
5	100	1
5	101	1
5	102	1
5	103	1
5	104	1
5	105	1
5	106	1
5	107	1
5	108	1
5	109	1
5	110	1
5	111	1
5	112	1
5	113	1
5	114	1
5	115	1
5	116	1
5	117	1
5	118	1
5	119	1
5	120	1
5	121	1
5	122	1
6	89	1
6	90	1
6	91	1
6	92	1
6	93	1
6	96	1
6	97	1
6	98	1
6	99	1
6	101	1
6	102	1
6	103	1
6	104	1
6	105	1
6	106	1
6	107	1
6	108	1
6	111	1
6	112	1
6	113	1
6	114	1
6	115	1
6	116	1
6	117	1
6	118	1
6	119	1
6	120	1
6	122	1
7	89	1
7	91	1
7	92	1
7	93	1
7	96	1
7	97	1
7	98	1
7	99	1
7	104	1
7	105	1
7	106	1
7	107	1
7	110	1
7	111	1
7	112	1
7	113	1
7	114	1
7	119	1
7	120	1
7	122	1
8	89	1
8	91	1
8	92	1
8	93	1
8	96	1
8	98	1
8	99	1
8	120	1
8	122	1
8	101	0
8	102	0
8	114	0
8	119	0
9	89	1
9	92	1
9	93	1
9	96	1
9	97	1
9	98	1
9	99	1
9	104	1
9	105	1
9	106	1
9	107	1
9	110	1
9	111	1
9	112	1
9	113	1
9	114	1
9	119	1
9	120	1
9	122	1
9	91	0
10	32	1
10	33	1
10	34	1
10	35	1
10	36	1
10	37	1
10	38	1
10	39	1
10	40	1
10	41	1
10	42	1
10	43	1
10	44	1
10	45	1
10	46	1
11	32	1
11	33	1
11	35	1
11	36	1
11	37	1
11	38	1
11	39	1
11	40	1
11	41	1
11	42	1
11	43	1
11	45	1
11	46	1
12	32	1
12	35	1
12	36	1
12	37	1
12	45	1
12	41	1
12	43	1
13	32	1
13	33	1
13	36	1
14	1	1
14	2	1
14	3	1
14	4	1
14	5	1
14	6	1
14	7	1
14	8	1
14	9	1
14	10	1
14	11	1
14	12	1
14	13	1
14	14	1
14	15	1
14	16	1
14	17	1
14	18	1
14	19	1
14	20	1
14	21	1
14	22	1
14	23	1
14	24	1
14	25	1
14	26	1
14	27	1
14	28	1
14	29	1
14	30	1
14	31	1
15	1	1
15	3	1
15	4	1
15	5	1
15	6	1
15	7	1
15	8	1
15	9	1
15	11	1
15	13	1
15	14	1
15	15	1
15	17	1
15	18	1
15	19	1
15	20	1
15	21	1
15	22	1
15	23	1
15	24	1
15	25	1
15	27	1
15	29	1
15	30	1
15	31	1
16	1	0
17	1	1
17	7	1
17	14	1
17	19	1
17	20	1
17	23	1
17	27	1
18	1	1
18	4	1
18	7	1
18	8	1
18	9	1
18	13	1
18	14	1
18	15	1
18	17	1
18	18	1
18	19	1
18	20	1
18	21	1
18	22	1
18	23	1
18	24	1
18	25	1
18	27	1
18	29	1
18	31	1
19	1	1
19	7	1
19	14	1
19	19	1
19	20	1
20	1	1
20	3	1
20	4	1
20	7	1
20	8	1
20	9	1
20	13	1
20	14	1
20	17	1
20	18	1
20	19	1
20	20	1
20	21	1
20	22	1
20	23	1
20	24	1
20	25	1
20	27	1
20	29	1
20	31	1
20	15	0
21	1	1
21	3	1
21	4	1
21	5	1
21	6	1
21	7	1
21	8	1
21	9	1
21	11	1
21	13	1
21	14	1
21	15	1
21	16	1
21	17	1
21	18	1
21	19	1
21	20	1
21	21	1
21	22	1
21	23	1
21	24	1
21	25	1
21	27	1
21	29	1
21	30	1
21	31	1
22	1	1
22	4	1
22	7	1
22	8	1
22	9	1
22	13	1
22	14	1
22	15	1
22	16	1
22	17	1
22	18	1
22	19	1
22	20	1
22	21	1
22	22	1
22	23	1
22	24	1
22	25	1
22	27	1
22	29	1
22	31	1
23	97	0
23	101	0
23	102	0
23	119	0
24	15	0
\.


--
-- Name: phpbb_acl_roles_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_acl_roles_seq', 24, true);


--
-- Data for Name: phpbb_acl_users; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_acl_users (user_id, forum_id, auth_option_id, auth_role_id, auth_setting) FROM stdin;
2	0	0	5	0
\.


--
-- Data for Name: phpbb_attachments; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_attachments (attach_id, post_msg_id, topic_id, in_message, poster_id, is_orphan, physical_filename, real_filename, download_count, attach_comment, extension, mimetype, filesize, filetime, thumbnail) FROM stdin;
\.


--
-- Name: phpbb_attachments_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_attachments_seq', 1, false);


--
-- Data for Name: phpbb_banlist; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_banlist (ban_id, ban_userid, ban_ip, ban_email, ban_start, ban_end, ban_exclude, ban_reason, ban_give_reason) FROM stdin;
\.


--
-- Name: phpbb_banlist_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_banlist_seq', 1, false);


--
-- Data for Name: phpbb_bbcodes; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_bbcodes (bbcode_id, bbcode_tag, bbcode_helpline, display_on_posting, bbcode_match, bbcode_tpl, first_pass_match, first_pass_replace, second_pass_match, second_pass_replace) FROM stdin;
\.


--
-- Data for Name: phpbb_bookmarks; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_bookmarks (topic_id, user_id) FROM stdin;
\.


--
-- Data for Name: phpbb_bots; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_bots (bot_id, bot_active, bot_name, user_id, bot_agent, bot_ip) FROM stdin;
1	1	AdsBot [Google]	3	AdsBot-Google	
2	1	Alexa [Bot]	4	ia_archiver	
3	1	Alta Vista [Bot]	5	Scooter/	
4	1	Ask Jeeves [Bot]	6	Ask Jeeves	
5	1	Baidu [Spider]	7	Baiduspider	
6	1	Bing [Bot]	8	bingbot/	
7	1	Exabot [Bot]	9	Exabot	
8	1	FAST Enterprise [Crawler]	10	FAST Enterprise Crawler	
9	1	FAST WebCrawler [Crawler]	11	FAST-WebCrawler/	
10	1	Francis [Bot]	12	http://www.neomo.de/	
11	1	Gigabot [Bot]	13	Gigabot/	
12	1	Google Adsense [Bot]	14	Mediapartners-Google	
13	1	Google Desktop	15	Google Desktop	
14	1	Google Feedfetcher	16	Feedfetcher-Google	
15	1	Google [Bot]	17	Googlebot	
16	1	Heise IT-Markt [Crawler]	18	heise-IT-Markt-Crawler	
17	1	Heritrix [Crawler]	19	heritrix/1.	
18	1	IBM Research [Bot]	20	ibm.com/cs/crawler	
19	1	ICCrawler - ICjobs	21	ICCrawler - ICjobs	
20	1	ichiro [Crawler]	22	ichiro/	
21	1	Majestic-12 [Bot]	23	MJ12bot/	
22	1	Metager [Bot]	24	MetagerBot/	
23	1	MSN NewsBlogs	25	msnbot-NewsBlogs/	
24	1	MSN [Bot]	26	msnbot/	
25	1	MSNbot Media	27	msnbot-media/	
26	1	Nutch [Bot]	28	http://lucene.apache.org/nutch/	
27	1	Online link [Validator]	29	online link validator	
28	1	psbot [Picsearch]	30	psbot/0	
29	1	Sensis [Crawler]	31	Sensis Web Crawler	
30	1	SEO Crawler	32	SEO search Crawler/	
31	1	Seoma [Crawler]	33	Seoma [SEO Crawler]	
32	1	SEOSearch [Crawler]	34	SEOsearch/	
33	1	Snappy [Bot]	35	Snappy/1.1 ( http://www.urltrends.com/ )	
34	1	Steeler [Crawler]	36	http://www.tkl.iis.u-tokyo.ac.jp/~crawler/	
35	1	Telekom [Bot]	37	crawleradmin.t-info@telekom.de	
36	1	TurnitinBot [Bot]	38	TurnitinBot/	
37	1	Voyager [Bot]	39	voyager/	
38	1	W3 [Sitesearch]	40	W3 SiteSearch Crawler	
39	1	W3C [Linkcheck]	41	W3C-checklink/	
40	1	W3C [Validator]	42	W3C_Validator	
41	1	YaCy [Bot]	43	yacybot	
42	1	Yahoo MMCrawler [Bot]	44	Yahoo-MMCrawler/	
43	1	Yahoo Slurp [Bot]	45	Yahoo! DE Slurp	
44	1	Yahoo [Bot]	46	Yahoo! Slurp	
45	1	YahooSeeker [Bot]	47	YahooSeeker/	
\.


--
-- Name: phpbb_bots_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_bots_seq', 45, true);


--
-- Data for Name: phpbb_config; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_config (config_name, config_value, is_dynamic) FROM stdin;
active_sessions	0	0
allow_attachments	1	0
allow_autologin	1	0
allow_avatar	1	0
allow_avatar_gravatar	0	0
allow_avatar_local	0	0
allow_avatar_remote	0	0
allow_avatar_upload	1	0
allow_avatar_remote_upload	0	0
allow_birthdays	1	0
allow_cdn	0	0
allow_emailreuse	0	0
allow_password_reset	1	0
allow_live_searches	1	0
allow_mass_pm	1	0
allow_name_chars	USERNAME_CHARS_ANY	0
allow_namechange	0	0
allow_pm_attach	0	0
allow_pm_report	1	0
allow_privmsg	1	0
allow_sig	1	0
allow_sig_bbcode	1	0
allow_sig_flash	0	0
allow_sig_img	1	0
allow_sig_links	1	0
allow_sig_pm	1	0
allow_sig_smilies	1	0
assets_version	1	0
attachment_quota	52428800	0
auth_bbcode_pm	1	0
auth_flash_pm	0	0
auth_img_pm	1	0
auth_method	db	0
auth_smilies_pm	1	0
avatar_filesize	6144	0
avatar_gallery_path	images/avatars/gallery	0
avatar_max_height	90	0
avatar_max_width	90	0
avatar_min_height	20	0
avatar_min_width	20	0
avatar_path	images/avatars/upload	0
board_contact_name		0
board_email_form	0	0
board_email_sig	Merci, l’équipe du forum	0
board_hide_emails	1	0
browser_check	1	0
cache_gc	7200	0
captcha_gd_foreground_noise	0	0
captcha_gd_x_grid	25	0
captcha_gd_y_grid	25	0
captcha_gd_wave	0	0
captcha_gd_3d_noise	1	0
captcha_gd_fonts	1	0
confirm_refresh	1	0
check_attachment_content	1	0
check_dnsbl	0	0
chg_passforce	0	0
contact_admin_form_enable	1	0
cookie_path	/	0
coppa_enable	0	0
coppa_fax		0
coppa_mail		0
database_gc	604800	0
display_last_subject	1	0
display_order	0	0
extension_force_unstable	0	0
email_check_mx	1	0
email_function_name	mail	0
email_max_chunk_size	50	0
email_package_size	20	0
enable_confirm	1	0
enable_pm_icons	1	0
feed_enable	1	0
feed_http_auth	0	0
feed_limit_post	15	0
feed_limit_topic	10	0
feed_overall_forums	0	0
feed_overall	1	0
feed_forum	1	0
feed_topic	1	0
feed_topics_new	1	0
feed_topics_active	0	0
feed_item_statistics	1	0
form_token_lifetime	7200	0
form_token_mintime	0	0
form_token_sid_guests	1	0
forward_pm	1	0
forwarded_for_check	0	0
full_folder_action	2	0
fulltext_mysql_max_word_len	254	0
fulltext_mysql_min_word_len	4	0
fulltext_native_common_thres	5	0
fulltext_native_load_upd	1	0
fulltext_native_max_chars	14	0
fulltext_native_min_chars	3	0
fulltext_postgres_max_word_len	254	0
fulltext_postgres_min_word_len	4	0
fulltext_postgres_ts_name	simple	0
fulltext_sphinx_indexer_mem_limit	512	0
fulltext_sphinx_stopwords	0	0
img_create_thumbnail	0	0
img_display_inlined	1	0
img_link_height	0	0
img_link_width	0	0
img_max_height	0	0
img_max_thumb_width	400	0
img_max_width	0	0
img_min_thumb_filesize	12000	0
ip_check	3	0
ip_login_limit_max	50	0
ip_login_limit_time	21600	0
ip_login_limit_use_forwarded	0	0
jab_enable	0	0
board_contact	julien.albinet@gmail.com	0
cookie_domain	forum.clashbzh.fr	0
board_timezone	UTC	0
email_enable	1	0
cookie_secure	0	0
allow_forum_notify	1	0
captcha_plugin	core.captcha.plugins.gd	0
captcha_gd	1	0
cookie_name	phpbb3_ccrlw	0
board_index_text		0
board_disable	0	0
board_disable_msg		0
default_dateformat	D j M Y H:i	0
default_style	1	0
enable_mod_rewrite	0	0
icons_path	images/icons	0
force_server_vars	0	0
allow_bbcode	1	0
allow_post_flash	1	0
allow_smilies	1	0
allow_post_links	1	0
allow_nocensors	0	0
allow_bookmarks	1	0
enable_post_confirm	1	0
allow_quick_reply	1	0
bump_type	d	0
edit_time	0	0
delete_time	0	0
display_last_edited	1	0
flood_interval	15	0
bump_interval	10	0
gzip_compress	0	0
allow_topic_notify	1	0
jab_host		0
jab_password		0
jab_package_size	20	0
jab_port	5222	0
jab_use_ssl	0	0
jab_username		0
ldap_base_dn		0
ldap_email		0
ldap_password		0
ldap_port		0
ldap_server		0
ldap_uid		0
ldap_user		0
ldap_user_filter		0
legend_sort_groupname	0	0
limit_load	0	0
limit_search_load	0	0
load_anon_lastread	0	0
load_birthdays	1	0
load_cpf_memberlist	1	0
load_cpf_pm	1	0
load_cpf_viewprofile	1	0
load_cpf_viewtopic	1	0
load_db_lastread	1	0
load_db_track	1	0
load_jquery_url	//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js	0
load_jumpbox	1	0
load_moderators	1	0
load_notifications	1	0
load_online	1	0
load_online_guests	1	0
load_online_time	5	0
load_onlinetrack	1	0
load_search	1	0
load_tplcompile	0	0
load_unreads_search	1	0
load_user_activity	1	0
max_attachments	3	0
max_attachments_pm	1	0
max_autologin_time	0	0
max_filesize	262144	0
max_filesize_pm	262144	0
max_login_attempts	3	0
max_name_chars	20	0
max_num_search_keywords	10	0
max_pass_chars	100	0
max_reg_attempts	5	0
max_sig_chars	255	0
max_sig_font_size	200	0
max_sig_img_height	0	0
max_sig_img_width	0	0
max_sig_smilies	0	0
max_sig_urls	5	0
min_name_chars	3	0
min_pass_chars	6	0
min_search_author_chars	3	0
mime_triggers	body|head|html|img|plaintext|a href|pre|script|table|title	0
new_member_post_limit	3	0
new_member_group_default	0	0
pass_complex	PASS_TYPE_ANY	0
pm_edit_time	0	0
pm_max_boxes	4	0
pm_max_msgs	50	0
pm_max_recipients	0	0
print_pm	1	0
queue_interval	60	0
read_notification_expire_days	30	0
read_notification_gc	86400	0
require_activation	0	0
referer_validation	1	0
search_block_size	250	0
search_gc	7200	0
search_interval	0	0
search_anonymous_interval	0	0
search_type	\\phpbb\\search\\fulltext_native	0
search_store_results	1800	0
secure_allow_deny	1	0
secure_allow_empty_referer	1	0
secure_downloads	0	0
session_gc	3600	0
session_length	3600	0
smtp_port	25	0
teampage_memberships	1	0
teampage_forums	1	0
tpl_allow_php	0	0
upload_path	files	0
version	3.1.9	0
warnings_gc	14400	0
last_queue_run	0	1
num_files	0	1
plupload_last_gc	0	1
search_indexing_state		1
upload_dir_size	0	1
board_startdate	1472549664	0
img_imagick	/usr/bin/	0
script_path	/	0
newest_user_id	50	1
board_email	julien.albinet@gmail.com	0
smtp_delivery	0	0
smtp_host		0
smtp_auth_method	PLAIN	0
smtp_username		0
smtp_password		0
num_users	3	1
server_port	80	0
avatar_salt	f089eda6ce023090eaafdc0a6ede59df	0
plupload_salt	414a72c7a386e3cd7c278b4fb8157253	0
dbms_version	9.4.8 on x86_64-unknown-linux-gnu, compiled by gcc (Debian 4.9.2-10) 4.9.2, 64-bit	0
record_online_date	1472553443	1
sitename	forum.clashbzh.fr	0
num_topics	0	1
rand_seed	1d99e019aeb3da64221ca5ff2056f5ad	1
cron_lock	0	1
search_last_gc	1473175450	1
read_notification_last_gc	1473277774	1
session_last_gc	1472852118	1
database_last_gc	1472549820	1
site_home_url		0
site_home_text		0
default_lang	fr	0
override_user_style	0	0
warnings_expire_days	90	0
smilies_path	images/smilies	0
upload_icons_path	images/upload_icons	0
ranks_path	images/ranks	0
server_protocol	http://	0
server_name	forum.clashbzh.fr	0
newest_username	Diabolesse	1
posts_per_page	20	0
topics_per_page	25	0
smilies_per_page	50	0
max_poll_options	10	0
max_post_chars	60000	0
min_post_chars	1	0
max_post_smilies	0	0
max_post_urls	0	0
max_post_font_size	200	0
max_quote_depth	3	0
max_post_img_width	0	0
record_online_users	3	1
use_system_cron	0	0
num_posts	1	1
newest_user_colour		1
questionnaire_unique_id	46ca78f98bf65596	0
site_desc	Forum des clans clash bzh et skol clash bzh	0
cache_last_gc	1473277790	1
auth_oauth_bitly_key		0
auth_oauth_bitly_secret		0
auth_oauth_facebook_key		0
auth_oauth_facebook_secret		0
auth_oauth_google_key		0
auth_oauth_google_secret		0
fulltext_sphinx_id	7b54a17d9372b406	0
rand_seed_last_update	1474396938	1
warnings_last_gc	1474396939	1
hot_threshold	25	0
max_post_img_height	0	0
\.


--
-- Data for Name: phpbb_config_text; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_config_text (config_name, config_value) FROM stdin;
contact_admin_info	
contact_admin_info_uid	
contact_admin_info_bitfield	
contact_admin_info_flags	7
\.


--
-- Data for Name: phpbb_confirm; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_confirm (confirm_id, session_id, confirm_type, code, seed, attempts) FROM stdin;
\.


--
-- Data for Name: phpbb_disallow; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_disallow (disallow_id, disallow_username) FROM stdin;
\.


--
-- Name: phpbb_disallow_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_disallow_seq', 1, false);


--
-- Data for Name: phpbb_drafts; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_drafts (draft_id, user_id, topic_id, forum_id, save_time, draft_subject, draft_message) FROM stdin;
\.


--
-- Name: phpbb_drafts_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_drafts_seq', 1, false);


--
-- Data for Name: phpbb_ext; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_ext (ext_name, ext_active, ext_state) FROM stdin;
\.


--
-- Data for Name: phpbb_extension_groups; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, allowed_forums, allow_in_pm) FROM stdin;
1	IMAGES	1	1	1		0		0
2	ARCHIVES	0	1	1		0		0
3	PLAIN_TEXT	0	0	1		0		0
4	DOCUMENTS	0	0	1		0		0
5	REAL_MEDIA	3	0	1		0		0
6	WINDOWS_MEDIA	2	0	1		0		0
7	FLASH_FILES	5	0	1		0		0
8	QUICKTIME_MEDIA	6	0	1		0		0
9	DOWNLOADABLE_FILES	0	0	1		0		0
\.


--
-- Name: phpbb_extension_groups_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_extension_groups_seq', 9, true);


--
-- Data for Name: phpbb_extensions; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_extensions (extension_id, group_id, extension) FROM stdin;
1	1	gif
2	1	png
3	1	jpeg
4	1	jpg
5	1	tif
6	1	tiff
7	1	tga
8	2	gtar
9	2	gz
10	2	tar
11	2	zip
12	2	rar
13	2	ace
14	2	torrent
15	2	tgz
16	2	bz2
17	2	7z
18	3	txt
19	3	c
20	3	h
21	3	cpp
22	3	hpp
23	3	diz
24	3	csv
25	3	ini
26	3	log
27	3	js
28	3	xml
29	4	xls
30	4	xlsx
31	4	xlsm
32	4	xlsb
33	4	doc
34	4	docx
35	4	docm
36	4	dot
37	4	dotx
38	4	dotm
39	4	pdf
40	4	ai
41	4	ps
42	4	ppt
43	4	pptx
44	4	pptm
45	4	odg
46	4	odp
47	4	ods
48	4	odt
49	4	rtf
50	5	rm
51	5	ram
52	6	wma
53	6	wmv
54	7	swf
55	8	mov
56	8	m4v
57	8	m4a
58	8	mp4
59	8	3gp
60	8	3g2
61	8	qt
62	9	mpeg
63	9	mpg
64	9	mp3
65	9	ogg
66	9	ogm
\.


--
-- Name: phpbb_extensions_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_extensions_seq', 66, true);


--
-- Data for Name: phpbb_forums; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_forums (forum_id, parent_id, left_id, right_id, forum_parents, forum_name, forum_desc, forum_desc_bitfield, forum_desc_options, forum_desc_uid, forum_link, forum_password, forum_style, forum_image, forum_rules, forum_rules_link, forum_rules_bitfield, forum_rules_options, forum_rules_uid, forum_topics_per_page, forum_type, forum_status, forum_last_post_id, forum_last_poster_id, forum_last_post_subject, forum_last_post_time, forum_last_poster_name, forum_last_poster_colour, forum_flags, display_on_index, enable_indexing, enable_icons, enable_prune, prune_next, prune_days, prune_viewed, prune_freq, display_subforum_list, forum_options, enable_shadow_prune, prune_shadow_days, prune_shadow_freq, prune_shadow_next, forum_posts_approved, forum_posts_unapproved, forum_posts_softdeleted, forum_topics_approved, forum_topics_unapproved, forum_topics_softdeleted) FROM stdin;
2	1	2	3	a:1:{i:1;a:2:{i:0;s:26:"Votre première catégorie";i:1;i:0;}}	Votre premier forum	Description de votre premier forum.		7				0					7		0	1	0	1	2	Bienvenue sur phpBB3	1472549664	Gus	AA0000	112	1	1	1	0	0	0	0	0	1	0	0	7	1	0	1	0	0	1	0	0
1	0	1	4		Votre première catégorie			7				0					7		0	0	0	1	2		1472549664	Gus	AA0000	96	1	1	1	0	0	0	0	0	1	0	0	7	1	0	0	0	0	0	0	0
\.


--
-- Data for Name: phpbb_forums_access; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_forums_access (forum_id, user_id, session_id) FROM stdin;
\.


--
-- Name: phpbb_forums_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_forums_seq', 2, true);


--
-- Data for Name: phpbb_forums_track; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_forums_track (user_id, forum_id, mark_time) FROM stdin;
2	2	1472554237
\.


--
-- Data for Name: phpbb_forums_watch; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_forums_watch (forum_id, user_id, notify_status) FROM stdin;
\.


--
-- Data for Name: phpbb_groups; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_groups (group_id, group_type, group_founder_manage, group_skip_auth, group_name, group_desc, group_desc_bitfield, group_desc_options, group_desc_uid, group_display, group_avatar, group_avatar_type, group_avatar_width, group_avatar_height, group_rank, group_colour, group_sig_chars, group_receive_pm, group_message_limit, group_legend, group_max_recipients) FROM stdin;
1	3	0	0	GUESTS			7		0			0	0	0		0	0	0	0	5
2	3	0	0	REGISTERED			7		0			0	0	0		0	0	0	0	5
3	3	0	0	REGISTERED_COPPA			7		0			0	0	0		0	0	0	0	5
4	3	0	0	GLOBAL_MODERATORS			7		0			0	0	0	00AA00	0	0	0	2	0
5	3	1	0	ADMINISTRATORS			7		0			0	0	0	AA0000	0	0	0	1	0
6	3	0	0	BOTS			7		0			0	0	0	9E8DA7	0	0	0	0	5
7	3	0	0	NEWLY_REGISTERED			7		0			0	0	0		0	0	0	0	5
\.


--
-- Name: phpbb_groups_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_groups_seq', 7, true);


--
-- Data for Name: phpbb_icons; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_icons (icons_id, icons_url, icons_width, icons_height, icons_order, display_on_posting) FROM stdin;
1	misc/fire.gif	16	16	1	1
2	smile/redface.gif	16	16	9	1
3	smile/mrgreen.gif	16	16	10	1
4	misc/heart.gif	16	16	4	1
5	misc/star.gif	16	16	2	1
6	misc/radioactive.gif	16	16	3	1
7	misc/thinking.gif	16	16	5	1
8	smile/info.gif	16	16	8	1
9	smile/question.gif	16	16	6	1
10	smile/alert.gif	16	16	7	1
\.


--
-- Name: phpbb_icons_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_icons_seq', 10, true);


--
-- Data for Name: phpbb_lang; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_lang (lang_id, lang_iso, lang_dir, lang_english_name, lang_local_name, lang_author) FROM stdin;
1	en	en	British English	British English	phpBB Limited
2	fr	fr	﻿French (formal)	Français (vouvoiement)	phpBB-fr.com
\.


--
-- Name: phpbb_lang_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_lang_seq', 2, true);


--
-- Data for Name: phpbb_log; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_log (log_id, log_type, user_id, forum_id, topic_id, reportee_id, log_ip, log_time, log_operation, log_data) FROM stdin;
1	0	2	0	0	0	185.74.42.82	1472549671	LOG_INSTALL_INSTALLED	a:1:{i:0;s:5:"3.1.9";}
2	0	2	0	0	0	185.74.42.82	1472550669	LOG_CONFIG_SETTINGS	
3	0	2	0	0	0	185.74.42.82	1472550824	LOG_CONFIG_SERVER	
4	1	2	2	1	0	185.74.42.82	1472552939	LOG_POST_APPROVED	a:1:{i:0;s:24:"Re: Bienvenue sur phpBB3";}
5	0	2	0	0	0	185.74.42.82	1472552968	LOG_ADMIN_AUTH_SUCCESS	
6	0	2	0	0	0	185.74.42.82	1472552991	LOG_CONFIG_POST	
7	0	2	0	0	0	185.74.42.82	1472553157	LOG_CONFIG_POST	
8	0	2	0	0	0	185.74.42.82	1472553225	LOG_CONFIG_SERVER	
9	1	2	2	1	0	185.74.42.82	1472553390	LOG_UNLOCK	a:1:{i:0;s:20:"Bienvenue sur phpBB3";}
10	1	2	2	3	0	185.74.42.82	1472553558	LOG_TOPIC_APPROVED	a:1:{i:0;s:20:"nouveau sujet membre";}
11	1	2	2	2	0	185.74.42.82	1472553565	LOG_POST_APPROVED	a:1:{i:0;s:21:"Re: tes nouveau sujet";}
12	1	2	2	2	0	185.74.42.82	1472553583	LOG_SOFTDELETE_POST	a:3:{i:0;s:21:"Re: tes nouveau sujet";i:1;s:7:"Horizon";i:2;s:0:"";}
13	1	2	2	2	0	185.74.42.82	1472553592	LOG_DELETE_POST	a:3:{i:0;s:21:"Re: tes nouveau sujet";i:1;s:7:"Horizon";i:2;s:0:"";}
14	1	2	2	3	0	185.74.42.82	1472553606	LOG_DELETE_TOPIC	a:3:{i:0;s:20:"nouveau sujet membre";i:1;s:7:"Horizon";i:2;s:0:"";}
15	0	2	0	0	0	185.74.42.82	1472553624	LOG_ADMIN_AUTH_SUCCESS	
16	0	2	0	0	0	185.74.42.82	1472554128	LOG_ACL_ADD_FORUM_LOCAL_F_	a:2:{i:0;s:47:"Votre première catégorie, Votre premier forum";i:1;s:59:"<span class="sep">Nouveaux utilisateurs enregistrés</span>";}
17	1	2	2	2	0	185.74.42.82	1472554229	LOG_DELETE_POST	a:3:{i:0;s:17:"tes nouveau sujet";i:1;s:3:"Gus";i:2;s:0:"";}
18	1	2	2	2	0	185.74.42.82	1472554234	LOG_DELETE_TOPIC	a:3:{i:0;s:17:"tes nouveau sujet";i:1;s:7:"Horizon";i:2;s:0:"";}
19	1	2	2	4	0	185.74.42.82	1472554248	LOG_DELETE_TOPIC	a:3:{i:0;s:7:"re test";i:1;s:7:"Horizon";i:2;s:0:"";}
20	1	2	2	1	0	185.74.42.82	1472554256	LOG_DELETE_POST	a:3:{i:0;s:24:"Re: Bienvenue sur phpBB3";i:1;s:7:"Horizon";i:2;s:0:"";}
21	0	2	0	0	0	185.74.42.82	1472554620	LOG_ADMIN_AUTH_SUCCESS	
22	0	2	0	0	0	185.74.42.82	1472554639	LOG_USER_DELETED	a:1:{i:0;s:7:"Horizon";}
\.


--
-- Name: phpbb_log_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_log_seq', 22, true);


--
-- Data for Name: phpbb_login_attempts; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_login_attempts (attempt_ip, attempt_browser, attempt_forwarded_for, attempt_time, user_id, username, username_clean) FROM stdin;
37.161.39.249	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Safari/537.36		1472852100	0	JouGe.56	jouge.56
37.161.39.249	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Safari/537.36		1472852118	0	JouGe.56	jouge.56
213.111.54.175	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36		1473277790	0	juleswarZ	juleswarz
213.111.54.175	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36		1473277800	0	juleswarZ	juleswarz
\.


--
-- Data for Name: phpbb_migrations; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_migrations (migration_name, migration_depends_on, migration_schema_done, migration_data_done, migration_data_state, migration_start_time, migration_end_time) FROM stdin;
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5	a:1:{i:0;s:52:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1part2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14_rc1	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc4	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc3	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc2	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc3	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_pl1	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc2	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc1	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1part2	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc4	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_pl1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc3	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_0";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc2	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc4";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc3	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_0	a:0:{}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc2	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\local_url_bbcode	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_rc1	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc2	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc1	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc2	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8_rc1	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_pl1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc4";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4_rc1	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc2	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8	a:1:{i:0;s:47:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8_rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\profilefield_remove_underscore_from_alpha	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v311";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\m_softdelete_global	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v311";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v313	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v313rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v314	a:2:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14";i:1;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v314rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\timezone	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v313rc1	a:5:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_rc1";i:1;s:54:"\\phpbb\\db\\migration\\data\\v31x\\plupload_last_gc_dynamic";i:2;s:71:"\\phpbb\\db\\migration\\data\\v31x\\profilefield_remove_underscore_from_alpha";i:3;s:59:"\\phpbb\\db\\migration\\data\\v31x\\profilefield_yahoo_update_url";i:4;s:60:"\\phpbb\\db\\migration\\data\\v31x\\update_custom_bbcodes_with_idn";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\update_custom_bbcodes_with_idn	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v312";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v315rc1	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v314";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\style_update	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v310\\gold";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v318rc1	a:2:{i:0;s:57:"\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_dateformat";i:1;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v317pl1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_dateformat	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v317";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v315	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v315rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v314rc2	a:2:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14_rc1";i:1;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v314rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v312	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v312rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\plupload_last_gc_dynamic	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v312";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v317rc1	a:2:{i:0;s:41:"\\phpbb\\db\\migration\\data\\v31x\\m_pm_report";i:1;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v316";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v318	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v318rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v319rc1	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v318";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v311	a:2:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v310\\gold";i:1;s:42:"\\phpbb\\db\\migration\\data\\v31x\\style_update";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v314rc1	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v313";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v316	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v316rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v316rc1	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v315";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v317pl1	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v317";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\profilefield_yahoo_update_url	a:1:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v312";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v317	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v317rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v313rc2	a:2:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_pl1";i:1;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v313rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v319	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v319rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\v312rc1	a:2:{i:0;s:34:"\\phpbb\\db\\migration\\data\\v31x\\v311";i:1;s:49:"\\phpbb\\db\\migration\\data\\v31x\\m_softdelete_global";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v31x\\m_pm_report	a:1:{i:0;s:37:"\\phpbb\\db\\migration\\data\\v31x\\v316rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\live_searches_config	a:0:{}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_website	a:2:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist";i:1;s:54:"\\phpbb\\db\\migration\\data\\v310\\profilefield_icq_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\extensions_version_check_force_unstable	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\notification_options_reconvert	a:1:{i:0;s:54:"\\phpbb\\db\\migration\\data\\v310\\notifications_schema_fix";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\reset_missing_captcha_plugin	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\dev	a:5:{i:0;s:40:"\\phpbb\\db\\migration\\data\\v310\\extensions";i:1;s:45:"\\phpbb\\db\\migration\\data\\v310\\style_update_p2";i:2;s:41:"\\phpbb\\db\\migration\\data\\v310\\timezone_p2";i:3;s:52:"\\phpbb\\db\\migration\\data\\v310\\reported_posts_display";i:4;s:46:"\\phpbb\\db\\migration\\data\\v310\\migrations_table";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_icq	a:1:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\remove_acp_styles_cache	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc4";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_website_cleanup	a:1:{i:0;s:50:"\\phpbb\\db\\migration\\data\\v310\\profilefield_website";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_skype	a:3:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field";i:1;s:55:"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rc4	a:2:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc3";i:1;s:57:"\\phpbb\\db\\migration\\data\\v310\\notifications_use_full_name";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rc3	a:5:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc2";i:1;s:45:"\\phpbb\\db\\migration\\data\\v310\\captcha_plugins";i:2;s:53:"\\phpbb\\db\\migration\\data\\v310\\rename_too_long_indexes";i:3;s:41:"\\phpbb\\db\\migration\\data\\v310\\search_type";i:4;s:49:"\\phpbb\\db\\migration\\data\\v310\\topic_sort_username";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_occupation	a:1:{i:0;s:52:"\\phpbb\\db\\migration\\data\\v310\\profilefield_interests";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist	a:1:{i:0;s:50:"\\phpbb\\db\\migration\\data\\v310\\profilefield_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\migrations_table	a:0:{}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\prune_shadow_topics	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\beta1	a:7:{i:0;s:36:"\\phpbb\\db\\migration\\data\\v310\\alpha3";i:1;s:42:"\\phpbb\\db\\migration\\data\\v310\\passwords_p2";i:2;s:52:"\\phpbb\\db\\migration\\data\\v310\\postgres_fulltext_drop";i:3;s:63:"\\phpbb\\db\\migration\\data\\v310\\profilefield_change_load_settings";i:4;s:51:"\\phpbb\\db\\migration\\data\\v310\\profilefield_location";i:5;s:54:"\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert2";i:6;s:48:"\\phpbb\\db\\migration\\data\\v310\\ucp_popuppm_module";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo_cleanup	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_aol_cleanup	a:1:{i:0;s:46:"\\phpbb\\db\\migration\\data\\v310\\profilefield_aol";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_location	a:2:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";i:1;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p1	a:1:{i:0;s:42:"\\phpbb\\db\\migration\\data\\v310\\passwords_p2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_field_validation_length	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_change_load_settings	a:1:{i:0;s:54:"\\phpbb\\db\\migration\\data\\v310\\profilefield_aol_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\ucp_popuppm_module	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_types	a:1:{i:0;s:36:"\\phpbb\\db\\migration\\data\\v310\\alpha2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\passwords_p2	a:1:{i:0;s:39:"\\phpbb\\db\\migration\\data\\v310\\passwords";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm	a:1:{i:0;s:58:"\\phpbb\\db\\migration\\data\\v310\\profilefield_website_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\alpha1	a:18:{i:0;s:46:"\\phpbb\\db\\migration\\data\\v30x\\local_url_bbcode";i:1;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12";i:2;s:57:"\\phpbb\\db\\migration\\data\\v310\\acp_style_components_module";i:3;s:39:"\\phpbb\\db\\migration\\data\\v310\\allow_cdn";i:4;s:49:"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth";i:5;s:37:"\\phpbb\\db\\migration\\data\\v310\\avatars";i:6;s:40:"\\phpbb\\db\\migration\\data\\v310\\boardindex";i:7;s:44:"\\phpbb\\db\\migration\\data\\v310\\config_db_text";i:8;s:45:"\\phpbb\\db\\migration\\data\\v310\\forgot_password";i:9;s:41:"\\phpbb\\db\\migration\\data\\v310\\mod_rewrite";i:10;s:49:"\\phpbb\\db\\migration\\data\\v310\\mysql_fulltext_drop";i:11;s:40:"\\phpbb\\db\\migration\\data\\v310\\namespaces";i:12;s:48:"\\phpbb\\db\\migration\\data\\v310\\notifications_cron";i:13;s:60:"\\phpbb\\db\\migration\\data\\v310\\notification_options_reconvert";i:14;s:38:"\\phpbb\\db\\migration\\data\\v310\\plupload";i:15;s:51:"\\phpbb\\db\\migration\\data\\v310\\signature_module_auth";i:16;s:52:"\\phpbb\\db\\migration\\data\\v310\\softdelete_mcp_modules";i:17;s:38:"\\phpbb\\db\\migration\\data\\v310\\teampage";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\captcha_plugins	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\softdelete_mcp_modules	a:2:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";i:1;s:43:"\\phpbb\\db\\migration\\data\\v310\\softdelete_p2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\config_db_text	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\teampage	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\mod_rewrite	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\notifications	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\acp_prune_users_module	a:1:{i:0;s:35:"\\phpbb\\db\\migration\\data\\v310\\beta1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\topic_sort_username	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_location_cleanup	a:1:{i:0;s:51:"\\phpbb\\db\\migration\\data\\v310\\profilefield_location";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rc2	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\softdelete_p1	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\signature_module_auth	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\style_update_p1	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rc5	a:3:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc4";i:1;s:66:"\\phpbb\\db\\migration\\data\\v310\\profilefield_field_validation_length";i:2;s:53:"\\phpbb\\db\\migration\\data\\v310\\remove_acp_styles_cache";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\mysql_fulltext_drop	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\contact_admin_acp_module	a:0:{}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_cleanup	a:2:{i:0;s:52:"\\phpbb\\db\\migration\\data\\v310\\profilefield_interests";i:1;s:53:"\\phpbb\\db\\migration\\data\\v310\\profilefield_occupation";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\notifications_cron	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v310\\notifications";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_facebook	a:3:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field";i:1;s:55:"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\beta3	a:6:{i:0;s:35:"\\phpbb\\db\\migration\\data\\v310\\beta2";i:1;s:50:"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth2";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\board_contact_name";i:3;s:44:"\\phpbb\\db\\migration\\data\\v310\\jquery_update2";i:4;s:50:"\\phpbb\\db\\migration\\data\\v310\\live_searches_config";i:5;s:49:"\\phpbb\\db\\migration\\data\\v310\\prune_shadow_topics";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\notifications_schema_fix	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v310\\notifications";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\beta4	a:3:{i:0;s:35:"\\phpbb\\db\\migration\\data\\v310\\beta3";i:1;s:69:"\\phpbb\\db\\migration\\data\\v310\\extensions_version_check_force_unstable";i:2;s:58:"\\phpbb\\db\\migration\\data\\v310\\reset_missing_captcha_plugin";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field	a:1:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\gold	a:2:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc6";i:1;s:40:"\\phpbb\\db\\migration\\data\\v310\\bot_update";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\timezone_p2	a:1:{i:0;s:38:"\\phpbb\\db\\migration\\data\\v310\\timezone";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\softdelete_p2	a:2:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";i:1;s:43:"\\phpbb\\db\\migration\\data\\v310\\softdelete_p1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rc6	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc5";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\style_update_p2	a:1:{i:0;s:45:"\\phpbb\\db\\migration\\data\\v310\\style_update_p1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rc1	a:9:{i:0;s:35:"\\phpbb\\db\\migration\\data\\v310\\beta4";i:1;s:54:"\\phpbb\\db\\migration\\data\\v310\\contact_admin_acp_module";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\contact_admin_form";i:3;s:50:"\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p2";i:4;s:51:"\\phpbb\\db\\migration\\data\\v310\\profilefield_facebook";i:5;s:53:"\\phpbb\\db\\migration\\data\\v310\\profilefield_googleplus";i:6;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_skype";i:7;s:50:"\\phpbb\\db\\migration\\data\\v310\\profilefield_twitter";i:8;s:50:"\\phpbb\\db\\migration\\data\\v310\\profilefield_youtube";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\boardindex	a:0:{}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\reported_posts_display	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_interests	a:2:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";i:1;s:55:"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p2	a:1:{i:0;s:50:"\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p1";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\board_contact_name	a:1:{i:0;s:35:"\\phpbb\\db\\migration\\data\\v310\\beta2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_googleplus	a:3:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field";i:1;s:55:"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\alpha2	a:2:{i:0;s:36:"\\phpbb\\db\\migration\\data\\v310\\alpha1";i:1;s:51:"\\phpbb\\db\\migration\\data\\v310\\notifications_cron_p2";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\search_type	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\jquery_update2	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v310\\jquery_update";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\postgres_fulltext_drop	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\notifications_cron_p2	a:1:{i:0;s:48:"\\phpbb\\db\\migration\\data\\v310\\notifications_cron";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\forgot_password	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth	a:0:{}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_icq_cleanup	a:1:{i:0;s:46:"\\phpbb\\db\\migration\\data\\v310\\profilefield_icq";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\jquery_update	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\bot_update	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc6";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\rename_too_long_indexes	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_0";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert2	a:1:{i:0;s:53:"\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm_cleanup	a:1:{i:0;s:46:"\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\extensions	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\contact_admin_form	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v310\\config_db_text";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_twitter	a:3:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field";i:1;s:55:"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\beta2	a:3:{i:0;s:35:"\\phpbb\\db\\migration\\data\\v310\\beta1";i:1;s:52:"\\phpbb\\db\\migration\\data\\v310\\acp_prune_users_module";i:2;s:59:"\\phpbb\\db\\migration\\data\\v310\\profilefield_location_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert	a:1:{i:0;s:36:"\\phpbb\\db\\migration\\data\\v310\\alpha3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_aol	a:1:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\alpha3	a:4:{i:0;s:36:"\\phpbb\\db\\migration\\data\\v310\\alpha2";i:1;s:42:"\\phpbb\\db\\migration\\data\\v310\\avatar_types";i:2;s:39:"\\phpbb\\db\\migration\\data\\v310\\passwords";i:3;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\passwords	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\plupload	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo	a:1:{i:0;s:54:"\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm_cleanup";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\profilefield_youtube	a:3:{i:0;s:56:"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field";i:1;s:55:"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue";i:2;s:48:"\\phpbb\\db\\migration\\data\\v310\\profilefield_types";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\acp_style_components_module	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\namespaces	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\notifications_use_full_name	a:1:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\rc3";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\avatars	a:1:{i:0;s:44:"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\avatar_types	a:2:{i:0;s:33:"\\phpbb\\db\\migration\\data\\v310\\dev";i:1;s:37:"\\phpbb\\db\\migration\\data\\v310\\avatars";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth2	a:1:{i:0;s:49:"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth";}	1	1		1472549672	1472549672
\\phpbb\\db\\migration\\data\\v310\\allow_cdn	a:1:{i:0;s:43:"\\phpbb\\db\\migration\\data\\v310\\jquery_update";}	1	1		1472549672	1472549672
\.


--
-- Data for Name: phpbb_moderator_cache; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_moderator_cache (forum_id, user_id, username, group_id, group_name, display_on_index) FROM stdin;
\.


--
-- Data for Name: phpbb_modules; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_modules (module_id, module_enabled, module_display, module_basename, module_class, parent_id, left_id, right_id, module_langname, module_mode, module_auth) FROM stdin;
4	1	1		acp	1	44	51	ACP_CLIENT_COMMUNICATION		
53	1	1	acp_board	acp	4	45	46	ACP_AUTH_SETTINGS	auth	acl_a_server
54	1	1	acp_board	acp	4	47	48	ACP_EMAIL_SETTINGS	email	acl_a_server
5	1	1		acp	1	52	65	ACP_SERVER_CONFIGURATION		
55	1	1	acp_board	acp	5	53	54	ACP_COOKIE_SETTINGS	cookie	acl_a_server
56	1	1	acp_board	acp	5	55	56	ACP_SERVER_SETTINGS	server	acl_a_server
57	1	1	acp_board	acp	5	57	58	ACP_SECURITY_SETTINGS	security	acl_a_server
58	1	1	acp_board	acp	5	59	60	ACP_LOAD_SETTINGS	load	acl_a_server
7	1	1		acp	6	68	73	ACP_MANAGE_FORUMS		
1	1	1		acp	0	1	66	ACP_CAT_GENERAL		
9	1	1		acp	0	87	114	ACP_CAT_POSTING		
10	1	1		acp	9	88	101	ACP_MESSAGES		
6	1	1		acp	0	67	86	ACP_CAT_FORUMS		
8	1	1		acp	6	74	85	ACP_FORUM_BASED_PERMISSIONS		
80	1	1	acp_main	acp	1	2	3	ACP_INDEX	main	
3	1	1		acp	1	18	43	ACP_BOARD_CONFIGURATION		
33	1	1	acp_attachments	acp	3	19	20	ACP_ATTACHMENT_SETTINGS	attach	acl_a_attach
43	1	1	acp_board	acp	3	21	22	ACP_BOARD_SETTINGS	settings	acl_a_board
44	1	1	acp_board	acp	3	23	24	ACP_BOARD_FEATURES	features	acl_a_board
45	1	1	acp_board	acp	3	25	26	ACP_AVATAR_SETTINGS	avatar	acl_a_board
46	1	1	acp_board	acp	3	27	28	ACP_MESSAGE_SETTINGS	message	acl_a_board
48	1	1	acp_board	acp	3	29	30	ACP_POST_SETTINGS	post	acl_a_board
50	1	1	acp_board	acp	3	31	32	ACP_SIGNATURE_SETTINGS	signature	acl_a_board
74	1	1	acp_jabber	acp	4	49	50	ACP_JABBER_SETTINGS	settings	acl_a_jabber
114	1	1	acp_search	acp	5	61	62	ACP_SEARCH_SETTINGS	settings	acl_a_search
116	1	1	acp_send_statistics	acp	5	63	64	ACP_SEND_STATISTICS	send_statistics	acl_a_server
2	1	1		acp	1	4	17	ACP_QUICK_ACCESS		
132	1	1	acp_users	acp	2	5	6	ACP_MANAGE_USERS	overview	acl_a_user
133	1	1	acp_groups	acp	2	7	8	ACP_GROUPS_MANAGE	manage	acl_a_group
134	1	1	acp_forums	acp	2	9	10	ACP_MANAGE_FORUMS	manage	acl_a_forum
51	1	1	acp_board	acp	3	33	34	ACP_FEED_SETTINGS	feed	acl_a_board
52	1	1	acp_board	acp	3	35	36	ACP_REGISTER_SETTINGS	registration	acl_a_board
110	1	1	acp_prune	acp	7	71	72	ACP_PRUNE_FORUMS	forums	acl_a_prune
140	1	1	acp_permissions	acp	8	79	80	ACP_FORUM_MODERATORS	setting_mod_local	acl_a_mauth && (acl_a_authusers || acl_a_authgroups)
42	1	1	acp_bbcodes	acp	10	89	90	ACP_BBCODES	bbcodes	acl_a_bbcode
47	1	1	acp_board	acp	10	91	92	ACP_MESSAGE_SETTINGS	message	acl_a_board
49	1	1	acp_board	acp	10	93	94	ACP_POST_SETTINGS	post	acl_a_board
71	1	1	acp_icons	acp	10	95	96	ACP_ICONS	icons	acl_a_icons
72	1	1	acp_icons	acp	10	97	98	ACP_SMILIES	smilies	acl_a_icons
131	1	1	acp_words	acp	10	99	100	ACP_WORDS	words	acl_a_words
11	1	1		acp	9	102	113	ACP_ATTACHMENTS		
34	1	1	acp_attachments	acp	11	103	104	ACP_ATTACHMENT_SETTINGS	attach	acl_a_attach
35	1	1	acp_attachments	acp	11	105	106	ACP_MANAGE_EXTENSIONS	extensions	acl_a_attach
36	1	1	acp_attachments	acp	11	107	108	ACP_EXTENSION_GROUPS	ext_groups	acl_a_attach
37	1	1	acp_attachments	acp	11	109	110	ACP_ORPHAN_ATTACHMENTS	orphan	acl_a_attach
38	1	1	acp_attachments	acp	11	111	112	ACP_MANAGE_ATTACHMENTS	manage	acl_a_attach
12	1	1		acp	0	115	172	ACP_CAT_USERGROUP		
13	1	1		acp	12	116	151	ACP_CAT_USERS		
73	1	1	acp_inactive	acp	13	117	118	ACP_INACTIVE_USERS	list	acl_a_user
120	1	1	acp_users	acp	13	119	120	ACP_MANAGE_USERS	overview	acl_a_user
94	1	1	acp_permissions	acp	13	121	122	ACP_USERS_PERMISSIONS	setting_user_global	acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)
96	1	1	acp_permissions	acp	13	123	124	ACP_USERS_FORUM_PERMISSIONS	setting_user_local	acl_a_authusers && (acl_a_mauth || acl_a_fauth)
109	1	1	acp_profile	acp	13	125	126	ACP_CUSTOM_PROFILE_FIELDS	profile	acl_a_profile
111	1	1	acp_prune	acp	13	127	128	ACP_PRUNE_USERS	users	acl_a_userdel
123	1	0	acp_users	acp	13	135	136	ACP_USER_PROFILE	profile	acl_a_user
124	1	0	acp_users	acp	13	137	138	ACP_USER_PREFS	prefs	acl_a_user
135	1	1	acp_logs	acp	2	11	12	ACP_MOD_LOGS	mod	acl_a_viewlogs
136	1	1	acp_bots	acp	2	13	14	ACP_BOTS	bots	acl_a_bots
60	1	1	acp_captcha	acp	3	37	38	ACP_VC_SETTINGS	visual	acl_a_board
61	1	0	acp_captcha	acp	3	39	40	ACP_VC_CAPTCHA_DISPLAY	img	acl_a_board
62	1	1	acp_contact	acp	3	41	42	ACP_CONTACT_SETTINGS	contact	acl_a_board
68	1	1	acp_forums	acp	7	69	70	ACP_MANAGE_FORUMS	manage	acl_a_forum
137	1	1	acp_php_info	acp	2	15	16	ACP_PHP_INFO	info	acl_a_phpinfo
138	1	1	acp_permissions	acp	8	75	76	ACP_FORUM_PERMISSIONS	setting_forum_local	acl_a_fauth && (acl_a_authusers || acl_a_authgroups)
139	1	1	acp_permissions	acp	8	77	78	ACP_FORUM_PERMISSIONS_COPY	setting_forum_copy	acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth
112	1	1	acp_ranks	acp	13	129	130	ACP_MANAGE_RANKS	ranks	acl_a_ranks
121	1	0	acp_users	acp	13	131	132	ACP_USER_FEEDBACK	feedback	acl_a_user
122	1	0	acp_users	acp	13	133	134	ACP_USER_WARNINGS	warnings	acl_a_user
129	1	0	acp_users	acp	13	147	148	ACP_USER_PERM	perm	acl_a_user && acl_a_viewauth
97	1	1	acp_permissions	acp	17	179	180	ACP_GROUPS_PERMISSIONS	setting_group_global	acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)
101	1	1	acp_permissions	acp	17	181	182	ACP_ADMINISTRATORS	setting_admin_global	acl_a_aauth && (acl_a_authusers || acl_a_authgroups)
102	1	1	acp_permissions	acp	17	183	184	ACP_GLOBAL_MODERATORS	setting_mod_global	acl_a_mauth && (acl_a_authusers || acl_a_authgroups)
90	1	1	acp_permissions	acp	18	187	188	ACP_FORUM_PERMISSIONS	setting_forum_local	acl_a_fauth && (acl_a_authusers || acl_a_authgroups)
91	1	1	acp_permissions	acp	18	189	190	ACP_FORUM_PERMISSIONS_COPY	setting_forum_copy	acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth
92	1	1	acp_permissions	acp	18	191	192	ACP_FORUM_MODERATORS	setting_mod_local	acl_a_mauth && (acl_a_authusers || acl_a_authgroups)
118	1	1	acp_styles	acp	22	231	232	ACP_STYLES_INSTALL	install	acl_a_styles
24	1	1		acp	21	234	237	ACP_LANGUAGE		
75	1	1	acp_language	acp	24	235	236	ACP_LANGUAGE_PACKS	lang_packs	acl_a_language
25	1	1		acp	0	239	258	ACP_CAT_MAINTENANCE		
26	1	1		acp	25	240	249	ACP_FORUM_LOGS		
76	1	1	acp_logs	acp	26	241	242	ACP_ADMIN_LOGS	admin	acl_a_viewlogs
77	1	1	acp_logs	acp	26	243	244	ACP_MOD_LOGS	mod	acl_a_viewlogs
78	1	1	acp_logs	acp	26	245	246	ACP_USERS_LOGS	users	acl_a_viewlogs
79	1	1	acp_logs	acp	26	247	248	ACP_CRITICAL_LOGS	critical	acl_a_viewlogs
27	1	1		acp	25	250	257	ACP_CAT_DATABASE		
63	1	1	acp_database	acp	27	251	252	ACP_BACKUP	backup	acl_a_backup
64	1	1	acp_database	acp	27	253	254	ACP_RESTORE	restore	acl_a_backup
115	1	1	acp_search	acp	27	255	256	ACP_SEARCH_INDEX	index	acl_a_search
28	1	1		acp	0	259	282	ACP_CAT_SYSTEM		
29	1	1		acp	28	260	263	ACP_AUTOMATION		
119	1	1	acp_update	acp	29	261	262	ACP_VERSION_CHECK	version_check	acl_a_board
30	1	1		acp	28	264	273	ACP_GENERAL_TASKS		
59	1	1	acp_bots	acp	30	265	266	ACP_BOTS	bots	acl_a_bots
141	1	1	acp_permissions	acp	8	81	82	ACP_USERS_FORUM_PERMISSIONS	setting_user_local	acl_a_authusers && (acl_a_mauth || acl_a_fauth)
125	1	0	acp_users	acp	13	139	140	ACP_USER_AVATAR	avatar	acl_a_user
126	1	0	acp_users	acp	13	141	142	ACP_USER_RANK	rank	acl_a_user
127	1	0	acp_users	acp	13	143	144	ACP_USER_SIG	sig	acl_a_user
128	1	0	acp_users	acp	13	145	146	ACP_USER_GROUPS	groups	acl_a_user && acl_a_group
130	1	0	acp_users	acp	13	149	150	ACP_USER_ATTACH	attach	acl_a_user
14	1	1		acp	12	152	161	ACP_GROUPS		
69	1	1	acp_groups	acp	14	153	154	ACP_GROUPS_MANAGE	manage	acl_a_group
70	1	1	acp_groups	acp	14	155	156	ACP_GROUPS_POSITION	position	acl_a_group
98	1	1	acp_permissions	acp	14	157	158	ACP_GROUPS_PERMISSIONS	setting_group_global	acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)
100	1	1	acp_permissions	acp	14	159	160	ACP_GROUPS_FORUM_PERMISSIONS	setting_group_local	acl_a_authgroups && (acl_a_mauth || acl_a_fauth)
15	1	1		acp	12	162	171	ACP_USER_SECURITY		
39	1	1	acp_ban	acp	15	163	164	ACP_BAN_EMAILS	email	acl_a_ban
40	1	1	acp_ban	acp	15	165	166	ACP_BAN_IPS	ip	acl_a_ban
41	1	1	acp_ban	acp	15	167	168	ACP_BAN_USERNAMES	user	acl_a_ban
65	1	1	acp_disallow	acp	15	169	170	ACP_DISALLOW_USERNAMES	usernames	acl_a_names
16	1	1		acp	0	173	222	ACP_CAT_PERMISSIONS		
88	1	1	acp_permissions	acp	16	174	175	ACP_PERMISSIONS	intro	acl_a_authusers || acl_a_authgroups || acl_a_viewauth
17	1	1		acp	16	176	185	ACP_GLOBAL_PERMISSIONS		
93	1	1	acp_permissions	acp	17	177	178	ACP_USERS_PERMISSIONS	setting_user_global	acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)
18	1	1		acp	16	186	197	ACP_FORUM_BASED_PERMISSIONS		
95	1	1	acp_permissions	acp	18	193	194	ACP_USERS_FORUM_PERMISSIONS	setting_user_local	acl_a_authusers && (acl_a_mauth || acl_a_fauth)
99	1	1	acp_permissions	acp	18	195	196	ACP_GROUPS_FORUM_PERMISSIONS	setting_group_local	acl_a_authgroups && (acl_a_mauth || acl_a_fauth)
19	1	1		acp	16	198	207	ACP_PERMISSION_ROLES		
84	1	1	acp_permission_roles	acp	19	199	200	ACP_ADMIN_ROLES	admin_roles	acl_a_roles && acl_a_aauth
85	1	1	acp_permission_roles	acp	19	201	202	ACP_USER_ROLES	user_roles	acl_a_roles && acl_a_uauth
86	1	1	acp_permission_roles	acp	19	203	204	ACP_MOD_ROLES	mod_roles	acl_a_roles && acl_a_mauth
87	1	1	acp_permission_roles	acp	19	205	206	ACP_FORUM_ROLES	forum_roles	acl_a_roles && acl_a_fauth
20	1	1		acp	16	208	221	ACP_PERMISSION_MASKS		
89	1	0	acp_permissions	acp	20	209	210	ACP_PERMISSION_TRACE	trace	acl_a_viewauth
103	1	1	acp_permissions	acp	20	211	212	ACP_VIEW_ADMIN_PERMISSIONS	view_admin_global	acl_a_viewauth
104	1	1	acp_permissions	acp	20	213	214	ACP_VIEW_USER_PERMISSIONS	view_user_global	acl_a_viewauth
105	1	1	acp_permissions	acp	20	215	216	ACP_VIEW_GLOBAL_MOD_PERMISSIONS	view_mod_global	acl_a_viewauth
106	1	1	acp_permissions	acp	20	217	218	ACP_VIEW_FORUM_MOD_PERMISSIONS	view_mod_local	acl_a_viewauth
107	1	1	acp_permissions	acp	20	219	220	ACP_VIEW_FORUM_PERMISSIONS	view_forum_local	acl_a_viewauth
21	1	1		acp	0	223	238	ACP_CAT_CUSTOMISE		
23	1	1		acp	21	224	227	ACP_EXTENSION_MANAGEMENT		
67	1	1	acp_extensions	acp	23	225	226	ACP_EXTENSIONS	main	acl_a_extensions
22	1	1		acp	21	228	233	ACP_STYLE_MANAGEMENT		
117	1	1	acp_styles	acp	22	229	230	ACP_STYLES	style	acl_a_styles
66	1	1	acp_email	acp	30	267	268	ACP_MASS_EMAIL	email	acl_a_email && cfg_email_enable
108	1	1	acp_php_info	acp	30	269	270	ACP_PHP_INFO	info	acl_a_phpinfo
113	1	1	acp_reasons	acp	30	271	272	ACP_MANAGE_REASONS	main	acl_a_reasons
31	1	1		acp	28	274	281	ACP_MODULE_MANAGEMENT		
81	1	1	acp_modules	acp	31	275	276	ACP	acp	acl_a_modules
82	1	1	acp_modules	acp	31	277	278	UCP	ucp	acl_a_modules
83	1	1	acp_modules	acp	31	279	280	MCP	mcp	acl_a_modules
32	1	1		acp	0	283	284	ACP_CAT_DOT_MODS		
142	1	1	acp_permissions	acp	8	83	84	ACP_GROUPS_FORUM_PERMISSIONS	setting_group_local	acl_a_authgroups && (acl_a_mauth || acl_a_fauth)
156	1	1	mcp_main	mcp	143	2	3	MCP_MAIN_FRONT	front	
157	1	1	mcp_main	mcp	143	4	5	MCP_MAIN_FORUM_VIEW	forum_view	acl_m_,$id
158	1	1	mcp_main	mcp	143	6	7	MCP_MAIN_TOPIC_VIEW	topic_view	acl_m_,$id
143	1	1		mcp	0	1	10	MCP_MAIN		
159	1	1	mcp_main	mcp	143	8	9	MCP_MAIN_POST_DETAILS	post_details	acl_m_,$id || (!$id && aclf_m_)
144	1	1		mcp	0	11	22	MCP_QUEUE		
146	1	1		mcp	0	37	42	MCP_NOTES		
160	1	1	mcp_notes	mcp	146	38	39	MCP_NOTES_FRONT	front	
161	1	1	mcp_notes	mcp	146	40	41	MCP_NOTES_USER	user_notes	
145	1	1		mcp	0	23	36	MCP_REPORTS		
165	1	1	mcp_queue	mcp	144	12	13	MCP_QUEUE_UNAPPROVED_TOPICS	unapproved_topics	aclf_m_approve
166	1	1	mcp_queue	mcp	144	14	15	MCP_QUEUE_UNAPPROVED_POSTS	unapproved_posts	aclf_m_approve
167	1	1	mcp_queue	mcp	144	16	17	MCP_QUEUE_DELETED_TOPICS	deleted_topics	aclf_m_approve
168	1	1	mcp_queue	mcp	144	18	19	MCP_QUEUE_DELETED_POSTS	deleted_posts	aclf_m_approve
169	1	1	mcp_queue	mcp	144	20	21	MCP_QUEUE_APPROVE_DETAILS	approve_details	acl_m_approve,$id || (!$id && aclf_m_approve)
173	1	1	mcp_warn	mcp	147	44	45	MCP_WARN_FRONT	front	aclf_m_warn
174	1	1	mcp_warn	mcp	147	46	47	MCP_WARN_LIST	list	aclf_m_warn
175	1	1	mcp_warn	mcp	147	48	49	MCP_WARN_USER	warn_user	aclf_m_warn
148	1	1		mcp	0	53	60	MCP_LOGS		
153	1	1	mcp_logs	mcp	148	54	55	MCP_LOGS_FRONT	front	acl_m_ || aclf_m_
154	1	1	mcp_logs	mcp	148	56	57	MCP_LOGS_FORUM_VIEW	forum_logs	acl_m_,$id
155	1	1	mcp_logs	mcp	148	58	59	MCP_LOGS_TOPIC_VIEW	topic_logs	acl_m_,$id
149	1	1		mcp	0	61	68	MCP_BAN		
150	1	1	mcp_ban	mcp	149	62	63	MCP_BAN_USERNAMES	user	acl_m_ban
151	1	1	mcp_ban	mcp	149	64	65	MCP_BAN_IPS	ip	acl_m_ban
152	1	1	mcp_ban	mcp	149	66	67	MCP_BAN_EMAILS	email	acl_m_ban
147	1	1		mcp	0	43	52	MCP_WARN		
176	1	1	mcp_warn	mcp	147	50	51	MCP_WARN_POST	warn_post	acl_m_warn && acl_f_read,$id
164	1	1	mcp_pm_reports	mcp	145	34	35	MCP_PM_REPORT_DETAILS	pm_report_details	acl_m_pm_report
163	1	1	mcp_pm_reports	mcp	145	32	33	MCP_PM_REPORTS_CLOSED	pm_reports_closed	acl_m_pm_report
162	1	1	mcp_pm_reports	mcp	145	30	31	MCP_PM_REPORTS_OPEN	pm_reports	acl_m_pm_report
170	1	1	mcp_reports	mcp	145	24	25	MCP_REPORTS_OPEN	reports	aclf_m_report
171	1	1	mcp_reports	mcp	145	26	27	MCP_REPORTS_CLOSED	reports_closed	aclf_m_report
172	1	1	mcp_reports	mcp	145	28	29	MCP_REPORT_DETAILS	report_details	acl_m_report,$id || (!$id && aclf_m_report)
177	1	1		ucp	0	1	14	UCP_MAIN		
192	1	1	ucp_notifications	ucp	177	12	13	UCP_NOTIFICATION_LIST	notification_list	
179	1	1		ucp	0	29	38	UCP_PREFS		
180	1	1	ucp_pm	ucp	0	39	48	UCP_PM		
193	1	0	ucp_pm	ucp	180	40	41	UCP_PM_VIEW	view	cfg_allow_privmsg
194	1	1	ucp_pm	ucp	180	42	43	UCP_PM_COMPOSE	compose	cfg_allow_privmsg
195	1	1	ucp_pm	ucp	180	44	45	UCP_PM_DRAFTS	drafts	cfg_allow_privmsg
196	1	1	ucp_pm	ucp	180	46	47	UCP_PM_OPTIONS	options	cfg_allow_privmsg
181	1	1		ucp	0	49	54	UCP_USERGROUPS		
185	1	1	ucp_groups	ucp	181	50	51	UCP_USERGROUPS_MEMBER	membership	
178	1	1		ucp	0	15	28	UCP_PROFILE		
183	1	1	ucp_attachments	ucp	177	10	11	UCP_MAIN_ATTACHMENTS	attachments	acl_u_attach
187	1	1	ucp_main	ucp	177	2	3	UCP_MAIN_FRONT	front	
188	1	1	ucp_main	ucp	177	4	5	UCP_MAIN_SUBSCRIBED	subscribed	
189	1	1	ucp_main	ucp	177	6	7	UCP_MAIN_BOOKMARKS	bookmarks	cfg_allow_bookmarks
190	1	1	ucp_main	ucp	177	8	9	UCP_MAIN_DRAFTS	drafts	
191	1	1	ucp_notifications	ucp	179	36	37	UCP_NOTIFICATION_OPTIONS	notification_options	
197	1	1	ucp_prefs	ucp	179	30	31	UCP_PREFS_PERSONAL	personal	
198	1	1	ucp_prefs	ucp	179	32	33	UCP_PREFS_POST	post	
199	1	1	ucp_prefs	ucp	179	34	35	UCP_PREFS_VIEW	view	
184	1	1	ucp_auth_link	ucp	178	26	27	UCP_AUTH_LINK_MANAGE	auth_link	authmethod_oauth
200	1	1	ucp_profile	ucp	178	16	17	UCP_PROFILE_PROFILE_INFO	profile_info	acl_u_chgprofileinfo
186	1	1	ucp_groups	ucp	181	52	53	UCP_USERGROUPS_MANAGE	manage	
205	1	1	ucp_zebra	ucp	182	56	57	UCP_ZEBRA_FRIENDS	friends	
182	1	1		ucp	0	55	60	UCP_ZEBRA		
206	1	1	ucp_zebra	ucp	182	58	59	UCP_ZEBRA_FOES	foes	
201	1	1	ucp_profile	ucp	178	18	19	UCP_PROFILE_SIGNATURE	signature	acl_u_sig
202	1	1	ucp_profile	ucp	178	20	21	UCP_PROFILE_AVATAR	avatar	cfg_allow_avatar
203	1	1	ucp_profile	ucp	178	22	23	UCP_PROFILE_REG_DETAILS	reg_details	
204	1	1	ucp_profile	ucp	178	24	25	UCP_PROFILE_AUTOLOGIN_KEYS	autologin_keys	
\.


--
-- Name: phpbb_modules_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_modules_seq', 206, true);


--
-- Data for Name: phpbb_notification_types; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_notification_types (notification_type_id, notification_type_name, notification_type_enabled) FROM stdin;
1	notification.type.topic	1
2	notification.type.approve_topic	1
3	notification.type.quote	1
4	notification.type.bookmark	1
5	notification.type.post	1
6	notification.type.approve_post	1
7	notification.type.post_in_queue	1
8	notification.type.topic_in_queue	1
9	notification.type.report_post	1
10	notification.type.group_request	1
11	notification.type.admin_activate_user	1
12	notification.type.pm	1
\.


--
-- Name: phpbb_notification_types_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_notification_types_seq', 12, true);


--
-- Data for Name: phpbb_notifications; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_notifications (notification_id, notification_type_id, item_id, item_parent_id, user_id, notification_read, notification_time, notification_data) FROM stdin;
6	12	1	0	48	1	1472554678	a:2:{s:12:"from_user_id";s:1:"2";s:15:"message_subject";s:9:"Bienvenue";}
\.


--
-- Name: phpbb_notifications_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_notifications_seq', 6, true);


--
-- Data for Name: phpbb_oauth_accounts; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_oauth_accounts (user_id, provider, oauth_provider_id) FROM stdin;
\.


--
-- Data for Name: phpbb_oauth_tokens; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_oauth_tokens (user_id, session_id, provider, oauth_token) FROM stdin;
\.


--
-- Data for Name: phpbb_poll_options; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_poll_options (poll_option_id, topic_id, poll_option_text, poll_option_total) FROM stdin;
\.


--
-- Data for Name: phpbb_poll_votes; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_poll_votes (topic_id, poll_option_id, vote_user_id, vote_user_ip) FROM stdin;
\.


--
-- Data for Name: phpbb_posts; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_posts (post_id, topic_id, forum_id, poster_id, icon_id, poster_ip, post_time, post_reported, enable_bbcode, enable_smilies, enable_magic_url, enable_sig, post_username, post_subject, post_text, post_checksum, post_attachment, bbcode_bitfield, bbcode_uid, post_postcount, post_edit_time, post_edit_reason, post_edit_user, post_edit_count, post_edit_locked, post_visibility, post_delete_time, post_delete_reason, post_delete_user) FROM stdin;
1	1	2	2	0	185.74.42.82	1472549664	0	1	1	1	1		Bienvenue sur phpBB3	Ceci est un exemple de message de votre installation phpBB3. Tout semble fonctionner. Vous pouvez si vous le voulez supprimer ce message et continuer à configurer votre forum. Durant le processus d’installation, votre première catégorie et votre premier forum sont assignés à un ensemble de permissions appropriées aux groupes d’utilisateurs que sont les administrateurs, les robots, les modérateurs globaux, les invités, les utilisateurs enregistrés et les utilisateurs COPPA enregistrés. Si vous choisissez de supprimer également votre première catégorie et votre premier forum, n’oubliez pas de régler les permissions de tous les groupes d’utilisateurs, pour toutes les nouvelles catégories et forums que vous allez créer. Il est recommandé de renommer votre première catégorie et votre premier forum et de copier leurs permissions sur chaque nouvelle catégorie et nouveau forum lors de leur création. Amusez-vous bien !	5dd683b17f641daf84c040bfefc58ce9	0			1	0		0	0	0	1	0		0
\.


--
-- Name: phpbb_posts_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_posts_seq', 7, true);


--
-- Data for Name: phpbb_privmsgs; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_privmsgs (msg_id, root_level, author_id, icon_id, author_ip, message_time, enable_bbcode, enable_smilies, enable_magic_url, enable_sig, message_subject, message_text, message_edit_reason, message_edit_user, message_attachment, bbcode_bitfield, bbcode_uid, message_edit_time, message_edit_count, to_address, bcc_address, message_reported) FROM stdin;
1	0	2	0	185.74.42.82	1472554678	1	1	1	1	Bienvenue	<!-- s:D --><img src="{SMILIES_PATH}/icon_e_biggrin.gif" alt=":D" title="Très content" /><!-- s:D -->		0	0		13sg63jf	0	0	u_48		0
\.


--
-- Data for Name: phpbb_privmsgs_folder; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_privmsgs_folder (folder_id, user_id, folder_name, pm_count) FROM stdin;
\.


--
-- Name: phpbb_privmsgs_folder_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_privmsgs_folder_seq', 1, false);


--
-- Data for Name: phpbb_privmsgs_rules; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_privmsgs_rules (rule_id, user_id, rule_check, rule_connection, rule_string, rule_user_id, rule_group_id, rule_action, rule_folder_id) FROM stdin;
\.


--
-- Name: phpbb_privmsgs_rules_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_privmsgs_rules_seq', 1, false);


--
-- Name: phpbb_privmsgs_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_privmsgs_seq', 1, true);


--
-- Data for Name: phpbb_privmsgs_to; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_privmsgs_to (msg_id, user_id, author_id, pm_deleted, pm_new, pm_unread, pm_replied, pm_marked, pm_forwarded, folder_id) FROM stdin;
1	2	2	0	0	0	0	0	0	-1
1	48	2	0	0	0	0	0	0	0
\.


--
-- Data for Name: phpbb_profile_fields; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_profile_fields (field_id, field_name, field_type, field_ident, field_length, field_minlen, field_maxlen, field_novalue, field_default_value, field_validation, field_required, field_show_on_reg, field_hide, field_no_view, field_active, field_order, field_show_profile, field_show_on_vt, field_show_novalue, field_show_on_pm, field_show_on_ml, field_is_contact, field_contact_desc, field_contact_url) FROM stdin;
1	phpbb_location	profilefields.type.string	phpbb_location	20	2	100			.*	0	0	0	0	1	1	1	1	0	1	1	0		
2	phpbb_website	profilefields.type.url	phpbb_website	40	12	255				0	0	0	0	1	2	1	1	0	1	1	1	VISIT_WEBSITE	%s
3	phpbb_interests	profilefields.type.text	phpbb_interests	3|30	2	500			.*	0	0	0	0	0	3	1	0	0	0	0	0		
4	phpbb_occupation	profilefields.type.text	phpbb_occupation	3|30	2	500			.*	0	0	0	0	0	4	1	0	0	0	0	0		
5	phpbb_aol	profilefields.type.string	phpbb_aol	40	5	255			.*	0	0	0	0	0	5	1	1	0	1	1	1		
6	phpbb_icq	profilefields.type.string	phpbb_icq	20	3	15			[0-9]+	0	0	0	0	0	6	1	1	0	1	1	1	SEND_ICQ_MESSAGE	https://www.icq.com/people/%s/
7	phpbb_wlm	profilefields.type.string	phpbb_wlm	40	5	255			.*	0	0	0	0	0	7	1	1	0	1	1	1		
8	phpbb_yahoo	profilefields.type.string	phpbb_yahoo	40	5	255			.*	0	0	0	0	0	8	1	1	0	1	1	1	SEND_YIM_MESSAGE	ymsgr:sendim?%s
9	phpbb_facebook	profilefields.type.string	phpbb_facebook	20	5	50			[\\w.]+	0	0	0	0	1	9	1	1	0	1	1	1	VIEW_FACEBOOK_PROFILE	http://facebook.com/%s/
10	phpbb_twitter	profilefields.type.string	phpbb_twitter	20	1	15			[\\w_]+	0	0	0	0	1	10	1	1	0	1	1	1	VIEW_TWITTER_PROFILE	http://twitter.com/%s
11	phpbb_skype	profilefields.type.string	phpbb_skype	20	6	32			[a-zA-Z][\\w\\.,\\-_]+	0	0	0	0	1	11	1	1	0	1	1	1	VIEW_SKYPE_PROFILE	skype:%s?userinfo
12	phpbb_youtube	profilefields.type.string	phpbb_youtube	20	3	60			[a-zA-Z][\\w\\.,\\-_]+	0	0	0	0	1	12	1	1	0	1	1	1	VIEW_YOUTUBE_CHANNEL	http://youtube.com/user/%s
13	phpbb_googleplus	profilefields.type.googleplus	phpbb_googleplus	20	3	255			[\\w]+	0	0	0	0	1	13	1	1	0	1	1	1	VIEW_GOOGLEPLUS_PROFILE	http://plus.google.com/%s
\.


--
-- Data for Name: phpbb_profile_fields_data; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_profile_fields_data (user_id, pf_phpbb_interests, pf_phpbb_occupation, pf_phpbb_location, pf_phpbb_googleplus, pf_phpbb_twitter, pf_phpbb_youtube, pf_phpbb_icq, pf_phpbb_skype, pf_phpbb_facebook, pf_phpbb_website, pf_phpbb_wlm, pf_phpbb_yahoo, pf_phpbb_aol) FROM stdin;
\.


--
-- Data for Name: phpbb_profile_fields_lang; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_profile_fields_lang (field_id, lang_id, option_id, field_type, lang_value) FROM stdin;
\.


--
-- Name: phpbb_profile_fields_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_profile_fields_seq', 13, true);


--
-- Data for Name: phpbb_profile_lang; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_profile_lang (field_id, lang_id, lang_name, lang_explain, lang_default_value) FROM stdin;
1	1	LOCATION		
1	2	LOCATION		
2	1	WEBSITE		
2	2	WEBSITE		
3	1	INTERESTS		
3	2	INTERESTS		
4	1	OCCUPATION		
4	2	OCCUPATION		
5	1	AOL		
5	2	AOL		
6	1	ICQ		
6	2	ICQ		
7	1	WLM		
7	2	WLM		
8	1	YAHOO		
8	2	YAHOO		
9	1	FACEBOOK		
9	2	FACEBOOK		
10	1	TWITTER		
10	2	TWITTER		
11	1	SKYPE		
11	2	SKYPE		
12	1	YOUTUBE		
12	2	YOUTUBE		
13	1	GOOGLEPLUS		
13	2	GOOGLEPLUS		
\.


--
-- Data for Name: phpbb_ranks; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_ranks (rank_id, rank_title, rank_min, rank_special, rank_image) FROM stdin;
1	Administrateur du site	0	1	
\.


--
-- Name: phpbb_ranks_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_ranks_seq', 1, true);


--
-- Data for Name: phpbb_reports; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_reports (report_id, reason_id, post_id, user_id, user_notify, report_closed, report_time, report_text, pm_id, reported_post_enable_bbcode, reported_post_enable_smilies, reported_post_enable_magic_url, reported_post_text, reported_post_uid, reported_post_bitfield) FROM stdin;
\.


--
-- Data for Name: phpbb_reports_reasons; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_reports_reasons (reason_id, reason_title, reason_description, reason_order) FROM stdin;
1	warez	Le message contient un lien vers un logiciel illégal ou piraté.	1
2	spam	Le message rapporté a été posté dans le seul but de promouvoir un site Internet ou un autre produit.	2
3	off_topic	Le message rapporté est hors sujet.	3
4	other	Le message rapporté n’entre dans aucune autre catégorie, utilisez le champ d’information complémentaire.	4
\.


--
-- Name: phpbb_reports_reasons_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_reports_reasons_seq', 4, true);


--
-- Name: phpbb_reports_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_reports_seq', 1, false);


--
-- Data for Name: phpbb_search_results; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_search_results (search_key, search_time, search_keywords, search_authors) FROM stdin;
\.


--
-- Data for Name: phpbb_search_wordlist; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_search_wordlist (word_id, word_text, word_common, word_count) FROM stdin;
73	fuck	0	0
72	membre	0	0
70	mon	0	0
71	tour	0	0
68	tes	0	0
69	sujet	0	0
60	nouveau	0	1
74	jour	0	0
75	besoin	0	0
76	approbation	0	0
43	pas	0	1
66	bienvenue	0	1
7	phpbb3	0	2
57	sur	0	2
67	test	0	0
1	ceci	0	1
2	est	0	1
3	exemple	0	1
4	message	0	1
5	votre	0	1
6	installation	0	1
8	tout	0	1
9	semble	0	1
10	fonctionner	0	1
11	vous	0	1
12	pouvez	0	1
13	voulez	0	1
14	supprimer	0	1
15	continuer	0	1
16	configurer	0	1
17	forum	0	1
18	durant	0	1
19	processus	0	1
20	première	0	1
21	catégorie	0	1
22	premier	0	1
23	sont	0	1
24	assignés	0	1
25	ensemble	0	1
26	permissions	0	1
27	appropriées	0	1
28	aux	0	1
29	groupes	0	1
30	utilisateurs	0	1
31	que	0	1
32	les	0	1
33	administrateurs	0	1
34	robots	0	1
35	modérateurs	0	1
36	globaux	0	1
37	invités	0	1
38	enregistrés	0	1
39	coppa	0	1
40	choisissez	0	1
41	également	0	1
42	oubliez	0	1
44	régler	0	1
45	tous	0	1
46	pour	0	1
47	toutes	0	1
48	nouvelles	0	1
49	catégories	0	1
50	forums	0	1
51	allez	0	1
52	créer	0	1
53	recommandé	0	1
54	renommer	0	1
55	copier	0	1
56	leurs	0	1
58	chaque	0	1
59	nouvelle	0	1
61	lors	0	1
62	leur	0	1
63	création	0	1
64	amusez	0	1
65	bien	0	1
\.


--
-- Name: phpbb_search_wordlist_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_search_wordlist_seq', 76, true);


--
-- Data for Name: phpbb_search_wordmatch; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_search_wordmatch (post_id, word_id, title_match) FROM stdin;
1	1	0
1	2	0
1	3	0
1	4	0
1	5	0
1	6	0
1	7	0
1	8	0
1	9	0
1	10	0
1	11	0
1	12	0
1	13	0
1	14	0
1	15	0
1	16	0
1	17	0
1	18	0
1	19	0
1	20	0
1	21	0
1	22	0
1	23	0
1	24	0
1	25	0
1	26	0
1	27	0
1	28	0
1	29	0
1	30	0
1	31	0
1	32	0
1	33	0
1	34	0
1	35	0
1	36	0
1	37	0
1	38	0
1	39	0
1	40	0
1	41	0
1	42	0
1	43	0
1	44	0
1	45	0
1	46	0
1	47	0
1	48	0
1	49	0
1	50	0
1	51	0
1	52	0
1	53	0
1	54	0
1	55	0
1	56	0
1	57	0
1	58	0
1	59	0
1	60	0
1	61	0
1	62	0
1	63	0
1	64	0
1	65	0
1	66	1
1	7	1
1	57	1
\.


--
-- Data for Name: phpbb_sessions; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_sessions (session_id, session_user_id, session_last_visit, session_start, session_time, session_ip, session_browser, session_forwarded_for, session_page, session_viewonline, session_autologin, session_admin, session_forum_id) FROM stdin;
a8bfe761dbcb604569f8ed6fc48fe00f	1	1472852075	1472852075	1472852081	37.161.39.249	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Safari/537.36		ucp.php?mode=login	1	0	0	0
449adb6516ac5ce75fe462335f1845f9	2	1472719938	1473061239	1473061240	185.74.42.82	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36		index.php	1	0	0	0
73b53d5db6049d7ca44817f32b1b066d	1	1473175442	1473175442	1473175442	185.74.42.82	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36		index.php	1	0	0	0
c4e6d4b03456a75cc8c8dafca10d388c	1	1473175443	1473175443	1473175450	185.74.42.82	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36		viewtopic.php?f=2&p=1	1	0	0	2
e7c2c9c930a5b079b8f8d09c79f0bf03	1	1473277773	1473277773	1473277789	213.111.54.175	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36		ucp.php?mode=login	1	0	0	0
5ab3a3bc539e447ef64d87a9e1fbdebd	1	1474396938	1474396938	1474396939	89.3.238.11	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36		app.php/favicon.ico	1	0	0	0
\.


--
-- Data for Name: phpbb_sessions_keys; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_sessions_keys (key_id, user_id, last_ip, last_login) FROM stdin;
a27006ad6f7da1b649ae147949945801	48	80.185.254.55	1472552306
48934389d4b0ba63b8d809165133ac01	50	109.106.74.162	1472723224
\.


--
-- Data for Name: phpbb_sitelist; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_sitelist (site_id, site_ip, site_hostname, ip_exclude) FROM stdin;
\.


--
-- Name: phpbb_sitelist_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_sitelist_seq', 1, false);


--
-- Data for Name: phpbb_smilies; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_smilies (smiley_id, code, emotion, smiley_url, smiley_width, smiley_height, smiley_order, display_on_posting) FROM stdin;
1	:D	Très content	icon_e_biggrin.gif	15	17	1	1
2	:-D	Très content	icon_e_biggrin.gif	15	17	2	1
3	:grin:	Très content	icon_e_biggrin.gif	15	17	3	1
4	:)	Sourire	icon_e_smile.gif	15	17	4	1
5	:-)	Sourire	icon_e_smile.gif	15	17	5	1
6	:smile:	Sourire	icon_e_smile.gif	15	17	6	1
7	;)	Clin d’œil	icon_e_wink.gif	15	17	7	1
8	;-)	Clin d’œil	icon_e_wink.gif	15	17	8	1
9	:wink:	Clin d’œil	icon_e_wink.gif	15	17	9	1
10	:(	Triste	icon_e_sad.gif	15	17	10	1
11	:-(	Triste	icon_e_sad.gif	15	17	11	1
12	:sad:	Triste	icon_e_sad.gif	15	17	12	1
13	:o	Surprise	icon_e_surprised.gif	15	17	13	1
14	:-o	Surprise	icon_e_surprised.gif	15	17	14	1
15	:eek:	Surprise	icon_e_surprised.gif	15	17	15	1
16	:shock:	Choqué	icon_eek.gif	15	17	16	1
17	:?	Confus	icon_e_confused.gif	15	17	17	1
18	:-?	Confus	icon_e_confused.gif	15	17	18	1
19	:???:	Confus	icon_e_confused.gif	15	17	19	1
20	8-)	Cool	icon_cool.gif	15	17	20	1
21	:cool:	Cool	icon_cool.gif	15	17	21	1
22	:lol:	Rire	icon_lol.gif	15	17	22	1
23	:x	Fou	icon_mad.gif	15	17	23	1
24	:-x	Fou	icon_mad.gif	15	17	24	1
25	:mad:	Fou	icon_mad.gif	15	17	25	1
26	:P	Tire la langue	icon_razz.gif	15	17	26	1
27	:-P	Tire la langue	icon_razz.gif	15	17	27	1
28	:razz:	Tire la langue	icon_razz.gif	15	17	28	1
29	:oops:	Embarrassé	icon_redface.gif	15	17	29	1
30	:cry:	Très triste, en pleurs	icon_cry.gif	15	17	30	1
31	:evil:	Diable	icon_evil.gif	15	17	31	1
32	:twisted:	Diable rieur	icon_twisted.gif	15	17	32	1
33	:roll:	Yeux tournants	icon_rolleyes.gif	15	17	33	1
34	:!:	Exclamation	icon_exclaim.gif	15	17	34	1
35	:?:	Question	icon_question.gif	15	17	35	1
36	:idea:	Idée	icon_idea.gif	15	17	36	1
37	:arrow:	Flèche	icon_arrow.gif	15	17	37	1
38	:|	Neutre	icon_neutral.gif	15	17	38	1
39	:-|	Neutre	icon_neutral.gif	15	17	39	1
40	:mrgreen:	M. Vert	icon_mrgreen.gif	15	17	40	1
41	:geek:	Geek	icon_e_geek.gif	17	17	41	1
42	:ugeek:	Geek barbu	icon_e_ugeek.gif	17	18	42	1
\.


--
-- Name: phpbb_smilies_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_smilies_seq', 42, true);


--
-- Data for Name: phpbb_styles; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_styles (style_id, style_name, style_copyright, style_active, style_path, bbcode_bitfield, style_parent_id, style_parent_tree) FROM stdin;
1	prosilver	&copy; phpBB Limited	1	prosilver	kNg=	0	
\.


--
-- Name: phpbb_styles_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_styles_seq', 1, true);


--
-- Data for Name: phpbb_teampage; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_teampage (teampage_id, group_id, teampage_name, teampage_position, teampage_parent) FROM stdin;
1	5		1	0
2	4		2	0
\.


--
-- Name: phpbb_teampage_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_teampage_seq', 2, true);


--
-- Data for Name: phpbb_topics; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_topics (topic_id, forum_id, icon_id, topic_attachment, topic_reported, topic_title, topic_poster, topic_time, topic_time_limit, topic_views, topic_status, topic_type, topic_first_post_id, topic_first_poster_name, topic_first_poster_colour, topic_last_post_id, topic_last_poster_id, topic_last_poster_name, topic_last_poster_colour, topic_last_post_subject, topic_last_post_time, topic_last_view_time, topic_moved_id, topic_bumped, topic_bumper, poll_title, poll_start, poll_length, poll_max_options, poll_last_vote, poll_vote_change, topic_visibility, topic_delete_time, topic_delete_reason, topic_delete_user, topic_posts_approved, topic_posts_unapproved, topic_posts_softdeleted) FROM stdin;
1	2	0	0	0	Bienvenue sur phpBB3	2	1472549664	0	18	0	0	1	Gus	AA0000	1	2	Gus	AA0000	Bienvenue sur phpBB3	1472549664	1473175450	0	0	0		0	0	1	0	0	1	0		0	1	0	0
\.


--
-- Data for Name: phpbb_topics_posted; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_topics_posted (user_id, topic_id, topic_posted) FROM stdin;
2	1	1
\.


--
-- Name: phpbb_topics_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_topics_seq', 4, true);


--
-- Data for Name: phpbb_topics_track; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_topics_track (user_id, topic_id, forum_id, mark_time) FROM stdin;
\.


--
-- Data for Name: phpbb_topics_watch; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_topics_watch (topic_id, user_id, notify_status) FROM stdin;
\.


--
-- Data for Name: phpbb_user_group; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_user_group (group_id, user_id, group_leader, user_pending) FROM stdin;
1	1	0	0
2	2	0	0
4	2	0	0
5	2	1	0
6	3	0	0
6	4	0	0
6	5	0	0
6	6	0	0
6	7	0	0
6	8	0	0
6	9	0	0
6	10	0	0
6	11	0	0
6	12	0	0
6	13	0	0
6	14	0	0
6	15	0	0
6	16	0	0
6	17	0	0
6	18	0	0
6	19	0	0
6	20	0	0
6	21	0	0
6	22	0	0
6	23	0	0
6	24	0	0
6	25	0	0
6	26	0	0
6	27	0	0
6	28	0	0
6	29	0	0
6	30	0	0
6	31	0	0
6	32	0	0
6	33	0	0
6	34	0	0
6	35	0	0
6	36	0	0
6	37	0	0
6	38	0	0
6	39	0	0
6	40	0	0
6	41	0	0
6	42	0	0
6	43	0	0
6	44	0	0
6	45	0	0
6	46	0	0
6	47	0	0
2	48	0	0
7	48	0	0
2	50	0	0
7	50	0	0
\.


--
-- Data for Name: phpbb_user_notifications; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_user_notifications (item_type, item_id, user_id, method, notify) FROM stdin;
notification.type.post	0	2		1
notification.type.post	0	2	notification.method.email	1
notification.type.topic	0	2		1
notification.type.topic	0	2	notification.method.email	1
notification.type.post	0	3		1
notification.type.post	0	3	notification.method.email	1
notification.type.topic	0	3		1
notification.type.topic	0	3	notification.method.email	1
notification.type.post	0	4		1
notification.type.post	0	4	notification.method.email	1
notification.type.topic	0	4		1
notification.type.topic	0	4	notification.method.email	1
notification.type.post	0	5		1
notification.type.post	0	5	notification.method.email	1
notification.type.topic	0	5		1
notification.type.topic	0	5	notification.method.email	1
notification.type.post	0	6		1
notification.type.post	0	6	notification.method.email	1
notification.type.topic	0	6		1
notification.type.topic	0	6	notification.method.email	1
notification.type.post	0	7		1
notification.type.post	0	7	notification.method.email	1
notification.type.topic	0	7		1
notification.type.topic	0	7	notification.method.email	1
notification.type.post	0	8		1
notification.type.post	0	8	notification.method.email	1
notification.type.topic	0	8		1
notification.type.topic	0	8	notification.method.email	1
notification.type.post	0	9		1
notification.type.post	0	9	notification.method.email	1
notification.type.topic	0	9		1
notification.type.topic	0	9	notification.method.email	1
notification.type.post	0	10		1
notification.type.post	0	10	notification.method.email	1
notification.type.topic	0	10		1
notification.type.topic	0	10	notification.method.email	1
notification.type.post	0	11		1
notification.type.post	0	11	notification.method.email	1
notification.type.topic	0	11		1
notification.type.topic	0	11	notification.method.email	1
notification.type.post	0	12		1
notification.type.post	0	12	notification.method.email	1
notification.type.topic	0	12		1
notification.type.topic	0	12	notification.method.email	1
notification.type.post	0	13		1
notification.type.post	0	13	notification.method.email	1
notification.type.topic	0	13		1
notification.type.topic	0	13	notification.method.email	1
notification.type.post	0	14		1
notification.type.post	0	14	notification.method.email	1
notification.type.topic	0	14		1
notification.type.topic	0	14	notification.method.email	1
notification.type.post	0	15		1
notification.type.post	0	15	notification.method.email	1
notification.type.topic	0	15		1
notification.type.topic	0	15	notification.method.email	1
notification.type.post	0	16		1
notification.type.post	0	16	notification.method.email	1
notification.type.topic	0	16		1
notification.type.topic	0	16	notification.method.email	1
notification.type.post	0	17		1
notification.type.post	0	17	notification.method.email	1
notification.type.topic	0	17		1
notification.type.topic	0	17	notification.method.email	1
notification.type.post	0	18		1
notification.type.post	0	18	notification.method.email	1
notification.type.topic	0	18		1
notification.type.topic	0	18	notification.method.email	1
notification.type.post	0	19		1
notification.type.post	0	19	notification.method.email	1
notification.type.topic	0	19		1
notification.type.topic	0	19	notification.method.email	1
notification.type.post	0	20		1
notification.type.post	0	20	notification.method.email	1
notification.type.topic	0	20		1
notification.type.topic	0	20	notification.method.email	1
notification.type.post	0	21		1
notification.type.post	0	21	notification.method.email	1
notification.type.topic	0	21		1
notification.type.topic	0	21	notification.method.email	1
notification.type.post	0	22		1
notification.type.post	0	22	notification.method.email	1
notification.type.topic	0	22		1
notification.type.topic	0	22	notification.method.email	1
notification.type.post	0	23		1
notification.type.post	0	23	notification.method.email	1
notification.type.topic	0	23		1
notification.type.topic	0	23	notification.method.email	1
notification.type.post	0	24		1
notification.type.post	0	24	notification.method.email	1
notification.type.topic	0	24		1
notification.type.topic	0	24	notification.method.email	1
notification.type.post	0	25		1
notification.type.post	0	25	notification.method.email	1
notification.type.topic	0	25		1
notification.type.topic	0	25	notification.method.email	1
notification.type.post	0	26		1
notification.type.post	0	26	notification.method.email	1
notification.type.topic	0	26		1
notification.type.topic	0	26	notification.method.email	1
notification.type.post	0	27		1
notification.type.post	0	27	notification.method.email	1
notification.type.topic	0	27		1
notification.type.topic	0	27	notification.method.email	1
notification.type.post	0	28		1
notification.type.post	0	28	notification.method.email	1
notification.type.topic	0	28		1
notification.type.topic	0	28	notification.method.email	1
notification.type.post	0	29		1
notification.type.post	0	29	notification.method.email	1
notification.type.topic	0	29		1
notification.type.topic	0	29	notification.method.email	1
notification.type.post	0	30		1
notification.type.post	0	30	notification.method.email	1
notification.type.topic	0	30		1
notification.type.topic	0	30	notification.method.email	1
notification.type.post	0	31		1
notification.type.post	0	31	notification.method.email	1
notification.type.topic	0	31		1
notification.type.topic	0	31	notification.method.email	1
notification.type.post	0	32		1
notification.type.post	0	32	notification.method.email	1
notification.type.topic	0	32		1
notification.type.topic	0	32	notification.method.email	1
notification.type.post	0	33		1
notification.type.post	0	33	notification.method.email	1
notification.type.topic	0	33		1
notification.type.topic	0	33	notification.method.email	1
notification.type.post	0	34		1
notification.type.post	0	34	notification.method.email	1
notification.type.topic	0	34		1
notification.type.topic	0	34	notification.method.email	1
notification.type.post	0	35		1
notification.type.post	0	35	notification.method.email	1
notification.type.topic	0	35		1
notification.type.topic	0	35	notification.method.email	1
notification.type.post	0	36		1
notification.type.post	0	36	notification.method.email	1
notification.type.topic	0	36		1
notification.type.topic	0	36	notification.method.email	1
notification.type.post	0	37		1
notification.type.post	0	37	notification.method.email	1
notification.type.topic	0	37		1
notification.type.topic	0	37	notification.method.email	1
notification.type.post	0	38		1
notification.type.post	0	38	notification.method.email	1
notification.type.topic	0	38		1
notification.type.topic	0	38	notification.method.email	1
notification.type.post	0	39		1
notification.type.post	0	39	notification.method.email	1
notification.type.topic	0	39		1
notification.type.topic	0	39	notification.method.email	1
notification.type.post	0	40		1
notification.type.post	0	40	notification.method.email	1
notification.type.topic	0	40		1
notification.type.topic	0	40	notification.method.email	1
notification.type.post	0	41		1
notification.type.post	0	41	notification.method.email	1
notification.type.topic	0	41		1
notification.type.topic	0	41	notification.method.email	1
notification.type.post	0	42		1
notification.type.post	0	42	notification.method.email	1
notification.type.topic	0	42		1
notification.type.topic	0	42	notification.method.email	1
notification.type.post	0	43		1
notification.type.post	0	43	notification.method.email	1
notification.type.topic	0	43		1
notification.type.topic	0	43	notification.method.email	1
notification.type.post	0	44		1
notification.type.post	0	44	notification.method.email	1
notification.type.topic	0	44		1
notification.type.topic	0	44	notification.method.email	1
notification.type.post	0	45		1
notification.type.post	0	45	notification.method.email	1
notification.type.topic	0	45		1
notification.type.topic	0	45	notification.method.email	1
notification.type.post	0	46		1
notification.type.post	0	46	notification.method.email	1
notification.type.topic	0	46		1
notification.type.topic	0	46	notification.method.email	1
notification.type.post	0	47		1
notification.type.post	0	47	notification.method.email	1
notification.type.topic	0	47		1
notification.type.topic	0	47	notification.method.email	1
notification.type.post	0	48		1
notification.type.post	0	48	notification.method.email	1
notification.type.topic	0	48		1
notification.type.topic	0	48	notification.method.email	1
notification.type.post	0	49		1
notification.type.post	0	49	notification.method.email	1
notification.type.topic	0	49		1
notification.type.topic	0	49	notification.method.email	1
notification.type.post	0	50		1
notification.type.post	0	50	notification.method.email	1
notification.type.topic	0	50		1
notification.type.topic	0	50	notification.method.email	1
\.


--
-- Data for Name: phpbb_users; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_users (user_id, user_type, group_id, user_permissions, user_perm_from, user_ip, user_regdate, username, username_clean, user_password, user_passchg, user_email, user_email_hash, user_birthday, user_lastvisit, user_lastmark, user_lastpost_time, user_lastpage, user_last_confirm_key, user_last_search, user_warnings, user_last_warning, user_login_attempts, user_inactive_reason, user_inactive_time, user_posts, user_lang, user_timezone, user_dateformat, user_style, user_rank, user_colour, user_new_privmsg, user_unread_privmsg, user_last_privmsg, user_message_rules, user_full_folder, user_emailtime, user_topic_show_days, user_topic_sortby_type, user_topic_sortby_dir, user_post_show_days, user_post_sortby_type, user_post_sortby_dir, user_notify, user_notify_pm, user_notify_type, user_allow_pm, user_allow_viewonline, user_allow_viewemail, user_allow_massemail, user_options, user_avatar, user_avatar_type, user_avatar_width, user_avatar_height, user_sig, user_sig_bbcode_uid, user_sig_bbcode_bitfield, user_jabber, user_actkey, user_newpasswd, user_form_salt, user_new, user_reminded, user_reminded_time) FROM stdin;
50	0	2	00000000000v667wt0\nqlc4pj000000\nqlc4pj000000	0	109.106.74.162	1472562118	Diabolesse	diabolesse	$2y$10$WjCffuX.suN9qG7JYHoxA.9yvpNoZVkfDA8Parp1SsN7QTQ9NV/oq	1472562118	bulldogcurtis67@hotmail.fr	242275079026		1472723224	1472562118	0	app.php/favicon.ico		0	0	0	0	0	0	0	fr	Antarctica/McMurdo	D j M Y H:i	1	0		0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	1	1	1	1	230271			0	0							75d9a5470907e81a	1	0	0
12	2	6		0		1472549669	Francis [Bot]	francis [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							e3172a2e9c3f7414	0	0	0
2	3	5	zik0zjzik0zjzik0zg\ni1cjyo000000\nzik0zjzi8sg0	0	185.74.42.82	1472549664	Gus	gus	$2y$10$7jtfx0cVf9XJmh3yxLMhoO65aPclReVF7urghrh5IBd/9SEiwfaLq	0	julien.albinet@gmail.com	396058378224		1472719938	0	1472554678	index.php		0	0	0	0	0	0	1	fr		D j M Y H:i	1	1	AA0000	0	0	0	0	-3	1472550764	0	t	d	0	t	a	0	1	0	1	1	1	1	230271			0	0							bdcea60883de21be	1	0	0
1	2	1	00000000000g13ydq8\ni1cjyo000000\ni1cjyo000000	0		1472549664	Anonymous	anonymous		0		0		0	0	0			0	0	0	0	0	0	0	en		d M Y H:i	1	0		0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	1	1	1	0	230271			0	0							a4daf258478dd2b1	1	0	0
3	2	6		0		1472549669	AdsBot [Google]	adsbot [google]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							b1e2bc89ba97e46a	0	0	0
4	2	6		0		1472549669	Alexa [Bot]	alexa [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							e86891759336c288	0	0	0
5	2	6		0		1472549669	Alta Vista [Bot]	alta vista [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							9f06cb863b51c41d	0	0	0
6	2	6		0		1472549669	Ask Jeeves [Bot]	ask jeeves [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							c69e6c950bdc59be	0	0	0
7	2	6		0		1472549669	Baidu [Spider]	baidu [spider]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							e83112c3c9304ffe	0	0	0
8	2	6		0		1472549669	Bing [Bot]	bing [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							4f78629689da5af9	0	0	0
9	2	6		0		1472549669	Exabot [Bot]	exabot [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							51615b0bb6336916	0	0	0
10	2	6		0		1472549669	FAST Enterprise [Crawler]	fast enterprise [crawler]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							0dc44f33a31777b4	0	0	0
11	2	6		0		1472549669	FAST WebCrawler [Crawler]	fast webcrawler [crawler]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							4f041324487122e9	0	0	0
13	2	6		0		1472549669	Gigabot [Bot]	gigabot [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							8f78efcc27cb1016	0	0	0
14	2	6		0		1472549669	Google Adsense [Bot]	google adsense [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							078c38c28a4e8dcc	0	0	0
15	2	6		0		1472549669	Google Desktop	google desktop		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							871face7d076ca62	0	0	0
16	2	6		0		1472549669	Google Feedfetcher	google feedfetcher		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							ef8e667b3a8a08e9	0	0	0
17	2	6		0		1472549669	Google [Bot]	google [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							8781befda46b8ef7	0	0	0
18	2	6		0		1472549669	Heise IT-Markt [Crawler]	heise it-markt [crawler]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							594add7a1f9e253d	0	0	0
19	2	6		0		1472549669	Heritrix [Crawler]	heritrix [crawler]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							11722c935c854d39	0	0	0
20	2	6		0		1472549669	IBM Research [Bot]	ibm research [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							e0f35c002d7003a8	0	0	0
21	2	6		0		1472549669	ICCrawler - ICjobs	iccrawler - icjobs		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							0f2e04f9477eeaef	0	0	0
22	2	6		0		1472549669	ichiro [Crawler]	ichiro [crawler]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							32571b3ac2c7a7c2	0	0	0
23	2	6		0		1472549669	Majestic-12 [Bot]	majestic-12 [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							81d4700ca21bac18	0	0	0
24	2	6		0		1472549669	Metager [Bot]	metager [bot]		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							e208b2480712eb29	0	0	0
25	2	6		0		1472549669	MSN NewsBlogs	msn newsblogs		1472549669		0		0	1472549669	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							49773d671b2f3ff4	0	0	0
26	2	6		0		1472549670	MSN [Bot]	msn [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							3e30e107bced8639	0	0	0
27	2	6		0		1472549670	MSNbot Media	msnbot media		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							b0558fb154069123	0	0	0
28	2	6		0		1472549670	Nutch [Bot]	nutch [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							6a20d87e5e8524db	0	0	0
29	2	6		0		1472549670	Online link [Validator]	online link [validator]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							709e37a8fb52824d	0	0	0
30	2	6		0		1472549670	psbot [Picsearch]	psbot [picsearch]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							d0d46636e37aeacb	0	0	0
31	2	6		0		1472549670	Sensis [Crawler]	sensis [crawler]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							b6232415b31964dc	0	0	0
32	2	6		0		1472549670	SEO Crawler	seo crawler		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							fa054035a1e7b56d	0	0	0
33	2	6		0		1472549670	Seoma [Crawler]	seoma [crawler]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							46f4dc07f5c1ee5d	0	0	0
34	2	6		0		1472549670	SEOSearch [Crawler]	seosearch [crawler]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							79c6ad100f4e8dbd	0	0	0
35	2	6		0		1472549670	Snappy [Bot]	snappy [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							477fd756164acba5	0	0	0
36	2	6		0		1472549670	Steeler [Crawler]	steeler [crawler]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							a2dea94f98ea9d95	0	0	0
37	2	6		0		1472549670	Telekom [Bot]	telekom [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							a15a5b3713227575	0	0	0
38	2	6		0		1472549670	TurnitinBot [Bot]	turnitinbot [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							04ac5b84a28b1e7c	0	0	0
39	2	6		0		1472549670	Voyager [Bot]	voyager [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							311521bed4a35bf9	0	0	0
40	2	6		0		1472549670	W3 [Sitesearch]	w3 [sitesearch]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							24f510ea8e1ea6d7	0	0	0
41	2	6		0		1472549670	W3C [Linkcheck]	w3c [linkcheck]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							77ab10d872e4a77d	0	0	0
42	2	6		0		1472549670	W3C [Validator]	w3c [validator]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							c3d46464173ba6f6	0	0	0
43	2	6		0		1472549670	YaCy [Bot]	yacy [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							d5b389e220bfde20	0	0	0
44	2	6		0		1472549670	Yahoo MMCrawler [Bot]	yahoo mmcrawler [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							b8fc7404269fe4fd	0	0	0
45	2	6		0		1472549670	Yahoo Slurp [Bot]	yahoo slurp [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							3be39f38ffcc6b4d	0	0	0
46	2	6		0		1472549670	Yahoo [Bot]	yahoo [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							29b41a5cf440b8d7	0	0	0
47	2	6		0		1472549670	YahooSeeker [Bot]	yahooseeker [bot]		1472549670		0		0	1472549670	0			0	0	0	0	0	0	0	fr	UTC	D j M Y H:i	1	0	9E8DA7	0	0	0	0	-3	0	0	t	d	0	t	a	0	1	0	0	1	1	0	230271			0	0							94c4571261c4ee65	0	0	0
48	0	2	00000000000v667wt0\nqlc4pj000000\nqlc4pj000000	0	80.185.254.55	1472551627	Marin	marin	$2y$10$aBgb60heVdXbJrX2BaP7A.tA93zavkuDP090LzmNvw0E32YGX2vkm	1472551627	lebistrodubout@live.fr	343218372022		1472565592	1472551627	0	ucp.php?i=ucp_profile&mode=avatar		0	0	0	0	0	0	0	fr	Europe/Paris	D j M Y H:i	1	0		0	0	1472551696	0	-3	0	0	t	d	0	t	a	0	1	0	1	1	1	1	230271			0	0	Amicalement.	j08akyyn					9db02d1718b7696d	1	0	0
\.


--
-- Name: phpbb_users_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_users_seq', 50, true);


--
-- Data for Name: phpbb_warnings; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_warnings (warning_id, user_id, post_id, log_id, warning_time) FROM stdin;
\.


--
-- Name: phpbb_warnings_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_warnings_seq', 1, false);


--
-- Data for Name: phpbb_words; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_words (word_id, word, replacement) FROM stdin;
\.


--
-- Name: phpbb_words_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('phpbb_words_seq', 1, false);


--
-- Data for Name: phpbb_zebra; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY phpbb_zebra (user_id, zebra_id, friend, foe) FROM stdin;
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY player (id, clan_id, tag, name, date_creation, date_maj, old, hdv, role, exp_level, war_stars) FROM stdin;
5	8	#292RQ9V2L	juleswarz	2016-11-11 19:33:45	\N	f	9	admin	116	662
97	8	#2LVYJQ2Y8	XERCES	2017-01-05 13:04:48	\N	f	9	member	100	159
72	8	#YYUJPLVY	Sergio	2016-12-04 21:27:55	\N	f	10	admin	108	424
7	8	#20QPV8R9	Marin	2016-11-11 19:33:46	\N	f	9	coLeader	122	352
98	8	#UV2UPU8U	KiKi Le PiRatE	2017-01-05 13:04:53	\N	f	9	member	125	677
37	8	#2YVC9YV0Q	...Diabolesse..	2016-11-11 19:33:56	\N	f	9	coLeader	126	525
94	9	#29CL8YLL8	omer	2016-12-29 21:32:44	\N	t	10	member	131	445
67	9	#QJRL9PJY	Solly	2016-11-29 11:27:02	\N	t	9	member	112	462
68	9	#800UYP0LY	Adrien	2016-11-29 11:27:06	\N	t	8	member	85	271
19	9	#9Y0QRG8JG	Tomcrouze	2016-11-11 19:33:50	\N	t	6	member	48	0
86	9	#2VLUJQLQY	Draagz-snp	2016-12-20 05:30:53	\N	t	9	member	94	495
99	8	#22VR0GCLC	PaPa PeUcH	2017-01-05 13:04:55	\N	f	9	member	129	801
54	8	#RLJ2L028	titouanjanis	2016-11-11 19:34:02	\N	f	9	admin	116	462
4	8	#P022GULV	xubakka	2016-11-11 19:33:44	\N	f	9	coLeader	109	359
101	8	#92LJ0R9RU	Ferrara	2017-01-05 13:05:01	\N	f	8	member	73	148
81	8	#G8LGU2U	flo	2016-12-15 09:30:06	\N	f	10	admin	131	428
2	8	#2999RL0Q	Evan	2016-11-11 19:33:43	\N	f	9	member	102	387
13	8	#2QLYYGURU	yanice	2016-11-11 19:33:48	\N	f	10	member	107	419
78	8	#RJUPYJPJ	jac91	2016-12-12 21:29:37	\N	f	9	member	90	284
88	8	#20QQLQ0VC	anael	2016-12-21 19:31:12	\N	f	9	member	109	376
9	9	#2YQLCLRR	Brooks	2016-11-11 19:33:46	\N	f	9	admin	106	247
47	9	#80P9GR2VQ	ninalys	2016-11-11 19:34:00	\N	f	9	admin	91	330
11	9	#2YU0JGVL8	LiaFarey	2016-11-11 19:33:47	\N	f	8	admin	84	237
87	9	#9ULJRLP0L	calamityjanis	2016-12-20 23:31:08	\N	f	4	member	23	1
53	8	#V89PCG8L	Gus	2016-11-11 19:34:02	\N	f	9	coLeader	104	423
15	8	#8YG0VG8JG	tristan	2016-11-11 19:33:48	\N	f	7	member	64	160
21	8	#8V9L88QVG	plop man	2016-11-11 19:33:50	\N	f	7	admin	48	39
52	8	#2JC8R0V9U	mikke	2016-11-11 19:34:02	\N	f	9	admin	96	159
91	8	#P8RY2L22	Fc SOCHAUX	2016-12-26 07:32:18	\N	t	8	member	81	82
90	8	#288LCCCJQ	shalev	2016-12-25 07:32:07	\N	t	9	member	107	259
80	8	#20JL9G2JQ	patt	2016-12-14 23:29:59	\N	f	10	admin	134	400
22	8	#98CQL80QL	xubakka	2016-11-11 19:33:51	\N	f	6	member	42	0
44	8	#C8Y9YR2U	racitinio	2016-11-11 19:33:59	\N	t	9	member	108	362
26	8	#YVUGU0V8	tristan	2016-11-11 19:33:53	\N	f	9	coLeader	130	976
12	8	#8CJPVYYRP	helbrecht l	2016-11-11 19:33:47	\N	f	9	member	95	232
85	8	#R29GCU8J	Matiusalem	2016-12-19 01:30:51	\N	f	9	member	103	471
33	8	#L0PJCJG0	Super VegeDave	2016-11-11 19:33:55	\N	f	10	coLeader	139	779
35	8	#LRYCRGY0	jibe79	2016-11-11 19:33:56	\N	f	9	coLeader	112	409
75	8	#UJ2QURV2	Seve	2016-12-08 21:28:37	\N	f	10	member	117	873
100	8	#2QPQGYVQP	calimero	2017-01-05 13:04:58	\N	f	10	member	146	648
38	8	#VVGC9RCC	Gil2 latourette	2016-11-11 19:33:57	\N	f	10	coLeader	125	627
49	8	#RLJ0C2VP	ju	2016-11-11 19:34:01	\N	f	9	admin	90	318
55	8	#22PYLLGQ9	cogbzh	2016-11-11 19:34:03	\N	f	8	member	86	375
62	9	#YQPG0QRC	YANN.LBR 76	2016-11-25 21:26:20	\N	t	9	member	101	237
71	9	#2P29QUG2G	jibax	2016-12-04 17:28:03	\N	t	7	member	64	123
70	9	#Y8R0GC98	greg972	2016-12-04 13:27:52	\N	t	10	member	100	314
23	9	#9G02GLQ8P	ExoStraw	2016-11-11 19:33:51	\N	t	3	member	10	0
74	9	#P9G9J2P	#V!NC69	2016-12-08 01:28:29	\N	t	10	member	127	101
65	9	#8C8U9LLCG	Lagertha	2016-11-26 23:26:36	\N	t	9	member	95	212
83	9	#2P8VV9G2G	vanessa	2016-12-16 09:30:15	\N	t	9	admin	118	411
95	9	#URYP9QCU	HALUFEIRO ROBER	2016-12-29 23:32:41	\N	t	10	member	126	483
34	9	#2RJ20UPU8	dexter	2016-11-11 19:33:55	\N	t	9	admin	117	431
30	9	#92P0QCLJ	rrhorrr dkvern	2016-11-11 19:33:54	\N	f	10	admin	122	612
69	9	#28890PCUQ	pro yo	2016-12-04 11:27:52	\N	f	10	admin	119	414
76	9	#228QG9Q08	Tony Du 56	2016-12-12 19:29:19	\N	f	9	admin	106	246
3	9	#JLU02UPG	Shermi	2016-11-11 19:33:44	\N	f	9	admin	114	371
6	9	#2Y2RU2002	kheldar	2016-11-11 19:33:45	\N	f	9	coLeader	116	421
51	9	#8UCR0JVLJ	tony25000	2016-11-11 19:34:01	\N	f	8	member	70	99
10	9	#2VQPJJ8	Vincent	2016-11-11 19:33:47	\N	f	8	member	90	188
58	9	#90PPVU2LY	Horizon	2016-11-11 19:34:04	\N	f	7	admin	52	20
96	8	#8CY0298VQ	Hugoboss2	2016-12-29 23:33:07	\N	t	8	member	66	60
27	8	#VLCCLGL0	King PHE	2016-11-11 19:33:53	\N	f	10	admin	118	622
39	8	#RYCLYVVR	rose écarlate	2016-11-11 19:33:57	\N	f	10	coLeader	132	776
73	9	#CPR2CV0L	olixx59	2016-12-05 23:28:08	\N	t	9	member	96	181
41	8	#2GYLPYCG0	neguess52	2016-11-11 19:33:58	\N	f	9	coLeader	105	774
28	8	#2C9VPVV2	bit&rrois56	2016-11-11 19:33:53	\N	f	9	coLeader	118	515
50	8	#2G0QV0U0V	Sonic Bibou	2016-11-11 19:34:01	\N	f	8	member	88	320
32	8	#R9RLUJLR	JouGe.56	2016-11-11 19:33:55	\N	f	10	leader	149	920
25	9	#QURRQLCP	Ghibli	2016-11-11 19:33:52	\N	f	10	admin	130	620
18	9	#8QUQ2PVUP	yuri nakamura	2016-11-11 19:33:49	\N	f	8	admin	82	160
16	9	#G8LLC2YR	GUEWEN	2016-11-11 19:33:49	\N	f	7	admin	60	275
20	9	#YU8LJLQ	Jouge56	2016-11-11 19:33:50	\N	f	6	coLeader	47	15
63	8	#2G298G2VG	Thomas H 974	2016-11-26 05:26:42	\N	t	8	member	115	150
93	8	#LCCL8PVJ	♠️AcE♠️	2016-12-27 23:32:28	\N	t	10	admin	158	623
92	8	#LCJ8GQL2	borgorel	2016-12-27 19:32:32	\N	t	9	member	95	51
89	8	#2GR000QGC	blakvicelar	2016-12-24 09:31:58	\N	t	9	member	99	193
43	8	#8J09JRGQV	DIAMOND DOG	2016-11-11 19:33:58	\N	f	8	admin	91	203
64	8	#2YY9VGJJR	jule	2016-11-26 21:26:31	\N	f	9	admin	132	790
8	8	#JCG2UL8Q	sylvain	2016-11-11 19:33:46	\N	f	9	admin	99	615
66	8	#9Q888QQ0Y	Eric L'Ancien	2016-11-28 11:26:56	\N	f	8	member	66	70
14	8	#2P0VRVCQC	Chou	2016-11-11 19:33:48	\N	f	8	admin	84	382
57	8	#8RQ2RR8JJ	bidou	2016-11-11 19:34:03	\N	f	8	member	71	140
17	8	#8YY2LV9JG	p'tit denez	2016-11-11 19:33:49	\N	f	8	admin	66	90
31	8	#20PQGPGRG	denez	2016-11-11 19:33:54	\N	f	11	coLeader	145	619
46	8	#PJCPC9GQ	simon	2016-11-11 19:34:00	\N	f	10	admin	131	363
1	8	#80YVYRLR	frere norris	2016-11-11 19:33:43	\N	f	11	admin	154	589
29	8	#CUGVLGLQ	flo-5613	2016-11-11 19:33:54	\N	f	10	member	127	193
56	8	#9PLJJL9Y	Cthulhu	2016-11-11 19:34:03	\N	f	8	member	86	468
36	9	#QQPCCJ0	MiniCox7	2016-11-11 19:33:56	\N	f	11	leader	160	456
24	9	#L2QL8J99	cox7	2016-11-11 19:33:52	\N	f	10	admin	135	498
40	8	#2P9J2QULQ	yoyo	2016-11-11 19:33:57	\N	t	9	member	94	577
82	8	#QCYLRC8J	sanka	2016-12-15 19:29:51	\N	t	10	member	152	882
59	8	#28LP98PL9	kissofkabylie	2016-11-12 19:33:44	\N	t	10	member	133	392
60	8	#8VG0PR0V	Feb	2016-11-14 09:33:58	\N	t	10	member	112	666
42	8	#PPLPRP8U	Dave	2016-11-11 19:33:58	\N	t	10	member	119	416
79	8	#2VY2JL82C	adx	2016-12-12 21:29:38	\N	t	9	member	103	274
48	8	#QJCRPYPC	Mickaël	2016-11-11 19:34:00	\N	t	9	member	137	247
61	8	#92G8JP0JC	ZKR	2016-11-15 03:34:10	\N	t	6	member	44	12
45	8	#V98CJP90	Kergwen	2016-11-11 19:33:59	\N	t	10	coLeader	135	800
84	8	#8YQ022YP8	kobeight	2016-12-18 19:30:52	\N	t	9	member	112	409
77	8	#2VQ88RPQC	Redoine	2016-12-12 21:29:35	\N	t	9	member	102	266
\.


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('player_id_seq', 101, true);


--
-- Data for Name: target; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY target (id, war_id, "position", hdv, comment, stars, date_creation, date_maj, image_id) FROM stdin;
303	23	3	10	\N	3	2016-11-15 10:33:43	\N	\N
254	19	14	9	\N	3	2016-11-11 09:45:29	\N	\N
313	23	13	9	\N	3	2016-11-15 10:33:43	\N	\N
316	23	16	8	\N	3	2016-11-15 10:33:43	\N	\N
375	27	15	7	\N	3	2016-11-17 07:24:48	\N	\N
260	19	20	7	\N	3	2016-11-11 09:45:29	\N	\N
248	19	8	9	\N	2	2016-11-11 09:45:29	\N	\N
301	23	1	11	\N	2	2016-11-15 10:33:43	\N	\N
245	19	5	10	\N	1	2016-11-11 09:45:29	\N	\N
315	23	15	8	\N	3	2016-11-15 10:33:43	\N	\N
243	19	3	10	\N	2	2016-11-11 09:45:29	\N	\N
289	21	19	7	\N	3	2016-11-13 09:24:12	\N	\N
290	21	20	7	\N	3	2016-11-13 09:24:12	\N	\N
273	21	3	10	\N	2	2016-11-13 09:24:12	\N	\N
246	19	6	10	\N	2	2016-11-11 09:45:29	\N	\N
285	21	15	8	\N	3	2016-11-13 09:24:12	\N	\N
288	21	18	7	\N	3	2016-11-13 09:24:12	\N	\N
287	21	17	7	\N	3	2016-11-13 09:24:12	\N	\N
251	19	11	9	\N	2	2016-11-11 09:45:29	\N	\N
286	21	16	7	\N	3	2016-11-13 09:24:12	\N	\N
278	21	8	9	\N	2	2016-11-13 09:24:12	\N	\N
306	23	6	9	\N	3	2016-11-15 10:33:43	\N	\N
305	23	5	10	\N	3	2016-11-15 10:33:43	\N	\N
272	21	2	10	\N	2	2016-11-13 09:24:12	\N	\N
311	23	11	9	\N	3	2016-11-15 10:33:43	\N	\N
282	21	12	9	\N	3	2016-11-13 09:24:12	\N	\N
279	21	9	9	\N	2	2016-11-13 09:24:12	\N	\N
284	21	14	9	\N	3	2016-11-13 09:24:12	\N	\N
276	21	6	10	\N	2	2016-11-13 09:24:12	\N	\N
249	19	9	9	\N	3	2016-11-11 09:45:29	\N	\N
275	21	5	10	\N	2	2016-11-13 09:24:12	\N	\N
256	19	16	9	\N	3	2016-11-11 09:45:29	\N	\N
271	21	1	10	\N	2	2016-11-13 09:24:12	\N	\N
281	21	11	9	\N	3	2016-11-13 09:24:12	\N	\N
277	21	7	10	\N	2	2016-11-13 09:24:12	\N	\N
255	19	15	10	\N	3	2016-11-11 09:45:29	\N	\N
258	19	18	8	\N	3	2016-11-11 09:45:29	\N	\N
244	19	4	10	\N	2	2016-11-11 09:45:29	\N	\N
252	19	12	9	\N	3	2016-11-11 09:45:29	\N	\N
257	19	17	8	\N	3	2016-11-11 09:45:29	\N	\N
242	19	2	10	\N	2	2016-11-11 09:45:29	\N	\N
304	23	4	10	\N	2	2016-11-15 10:33:43	\N	\N
241	19	1	10	\N	2	2016-11-11 09:45:29	\N	\N
259	19	19	8	\N	3	2016-11-11 09:45:29	\N	\N
280	21	10	9	\N	3	2016-11-13 09:24:12	\N	\N
250	19	10	9	\N	3	2016-11-11 09:45:29	\N	\N
253	19	13	9	\N	3	2016-11-11 09:45:29	\N	\N
247	19	7	11	\N	2	2016-11-11 09:45:29	\N	\N
274	21	4	10	\N	2	2016-11-13 09:24:12	\N	\N
293	22	3	1	\N	3	2016-11-14 15:10:52	\N	\N
294	22	4	1	\N	2	2016-11-14 15:10:52	\N	\N
298	22	8	1	\N	3	2016-11-14 15:10:52	\N	\N
283	21	13	9	\N	3	2016-11-13 09:24:12	\N	\N
295	22	5	1	\N	2	2016-11-14 15:10:52	\N	\N
296	22	6	1	\N	2	2016-11-14 15:10:52	\N	\N
309	23	9	9	\N	3	2016-11-15 10:33:43	\N	\N
292	22	2	1	\N	2	2016-11-14 15:10:52	\N	\N
291	22	1	1	\N	2	2016-11-14 15:10:52	\N	\N
297	22	7	1	\N	3	2016-11-14 15:10:52	\N	\N
300	22	10	1	\N	3	2016-11-14 15:10:52	\N	\N
299	22	9	1	\N	3	2016-11-14 15:10:52	\N	\N
447	34	2	9	\N	2	2016-11-23 08:55:09	\N	\N
371	27	11	8	\N	3	2016-11-17 07:24:48	\N	\N
367	27	7	9	\N	3	2016-11-17 07:24:48	\N	\N
372	27	12	8	\N	3	2016-11-17 07:24:48	\N	\N
307	23	7	9	\N	3	2016-11-15 10:33:43	\N	\N
319	23	19	8	\N	3	2016-11-15 10:33:43	\N	\N
366	27	6	9	\N	2	2016-11-17 07:24:48	\N	\N
317	23	17	8	\N	3	2016-11-15 10:33:43	\N	\N
302	23	2	11	Je pensai sortir le cdc avec 1 cochon, aqw+sapeur au sud pour le niquer et aller chercher l'aigle. Bouliste (cdc)+fées+sapeurs à l'ouest pour clean. Seisme pour ouvrir les 2 rangées centrales et gowiva droit sur l'hdv.\r\n\r\nÇa paraît cohérent ?\r\n\r\nJ'attends (jusqu'à midi) pour confirmation.  Merci	2	2016-11-15 10:33:43	\N	6
369	27	9	9	\N	3	2016-11-17 07:24:48	\N	\N
312	23	12	9	\N	3	2016-11-15 10:33:43	\N	\N
314	23	14	9	\N	3	2016-11-15 10:33:43	\N	\N
318	23	18	8	\N	3	2016-11-15 10:33:43	\N	\N
320	23	20	7	\N	3	2016-11-15 10:33:43	\N	\N
308	23	8	9	\N	3	2016-11-15 10:33:43	\N	\N
353	26	3	9	\N	3	2016-11-16 22:58:25	\N	\N
358	26	8	1	\N	3	2016-11-16 22:58:25	\N	\N
359	26	9	1	\N	3	2016-11-16 22:58:25	\N	\N
354	26	4	1	\N	2	2016-11-16 22:58:25	\N	\N
362	27	2	10	\N	2	2016-11-17 07:24:48	\N	\N
363	27	3	10	\N	2	2016-11-17 07:24:48	\N	\N
370	27	10	10	\N	3	2016-11-17 07:24:48	\N	\N
368	27	8	10	\N	3	2016-11-17 07:24:48	\N	\N
361	27	1	10	\N	2	2016-11-17 07:24:48	\N	\N
310	23	10	9	\N	3	2016-11-15 10:33:43	\N	\N
374	27	14	7	\N	3	2016-11-17 07:24:48	\N	\N
352	26	2	9	Gus: Vous avez la possibilité de changer le niveau de l'hdv de l'ennemi en cliquant dessus :)	3	2016-11-16 22:58:25	\N	\N
356	26	6	1	\N	3	2016-11-16 22:58:25	\N	\N
355	26	5	9	\N	3	2016-11-16 22:58:25	\N	\N
351	26	1	1	\N	3	2016-11-16 22:58:25	\N	\N
373	27	13	8	\N	3	2016-11-17 07:24:48	\N	\N
365	27	5	10	\N	2	2016-11-17 07:24:48	\N	\N
357	26	7	1	\N	3	2016-11-16 22:58:25	\N	\N
364	27	4	10	\N	2	2016-11-17 07:24:48	\N	\N
360	26	10	1	\N	3	2016-11-16 22:58:25	\N	\N
388	28	13	8	\N	3	2016-11-19 12:47:46	\N	\N
384	28	9	9	\N	3	2016-11-19 12:47:46	\N	\N
383	28	8	9	\N	3	2016-11-19 12:47:46	\N	\N
382	28	7	9	\N	2	2016-11-19 12:47:46	\N	\N
377	28	2	10	\N	2	2016-11-19 12:47:46	\N	\N
385	28	10	8	\N	3	2016-11-19 12:47:46	\N	\N
379	28	4	10	\N	2	2016-11-19 12:47:46	\N	\N
381	28	6	9	\N	3	2016-11-19 12:47:46	\N	\N
378	28	3	10	\N	1	2016-11-19 12:47:46	\N	\N
438	33	3	1	\N	2	2016-11-21 12:42:58	\N	\N
441	33	6	1	\N	\N	2016-11-21 12:42:58	\N	\N
387	28	12	8	\N	3	2016-11-19 12:47:46	\N	\N
389	28	14	8	\N	3	2016-11-19 12:47:46	\N	\N
390	28	15	8	\N	3	2016-11-19 12:47:46	\N	\N
466	35	11	8	\N	3	2016-11-23 16:10:14	\N	\N
418	31	8	1	\N	3	2016-11-19 15:37:41	\N	\N
420	31	10	1	\N	3	2016-11-19 15:37:41	\N	\N
416	31	6	1	\N	3	2016-11-19 15:37:41	\N	\N
433	32	13	7	\N	3	2016-11-21 08:51:40	\N	\N
386	28	11	8	\N	3	2016-11-19 12:47:46	\N	\N
419	31	9	1	\N	3	2016-11-19 15:37:41	\N	\N
380	28	5	9	Cdc découvert il y a 1bb drag 2 valky et 1 sorcier\r\nBon courage	3	2016-11-19 12:47:46	\N	\N
464	35	9	8	\N	3	2016-11-23 16:10:14	\N	\N
412	31	2	1	\N	3	2016-11-19 15:37:41	\N	\N
411	31	1	1	\N	3	2016-11-19 15:37:41	\N	\N
414	31	4	1	\N	3	2016-11-19 15:37:41	\N	\N
417	31	7	1	\N	3	2016-11-19 15:37:41	\N	\N
413	31	3	1	\N	2	2016-11-19 15:37:41	\N	\N
415	31	5	1	\N	2	2016-11-19 15:37:41	\N	\N
442	33	7	1	\N	3	2016-11-21 12:42:58	\N	\N
376	28	1	11	\N	1	2016-11-19 12:47:46	\N	\N
483	37	3	9	\N	2	2016-11-25 00:26:00	\N	\N
457	35	2	10	\N	2	2016-11-23 16:10:13	\N	\N
439	33	4	1	\N	3	2016-11-21 12:42:58	\N	\N
440	33	5	1	\N	2	2016-11-21 12:42:58	\N	\N
465	35	10	8	\N	3	2016-11-23 16:10:14	\N	\N
421	32	1	10	Si vous me cherchez, je suis parti me pendre :'(	0	2016-11-21 08:51:40	\N	\N
422	32	2	10	\N	2	2016-11-21 08:51:40	\N	\N
426	32	6	9	\N	3	2016-11-21 08:51:40	\N	\N
445	33	10	1	\N	3	2016-11-21 12:42:58	\N	\N
460	35	5	10	\N	2	2016-11-23 16:10:13	\N	\N
434	32	14	6	\N	3	2016-11-21 08:51:40	\N	\N
432	32	12	7	\N	3	2016-11-21 08:51:40	\N	\N
431	32	11	8	\N	3	2016-11-21 08:51:40	\N	\N
444	33	9	1	\N	3	2016-11-21 12:42:58	\N	\N
437	33	2	1	\N	3	2016-11-21 12:42:58	\N	\N
436	33	1	1	\N	2	2016-11-21 12:42:58	\N	\N
458	35	3	10	\N	2	2016-11-23 16:10:13	\N	\N
456	35	1	10	\N	1	2016-11-23 16:10:13	\N	\N
424	32	4	10	\N	1	2016-11-21 08:51:40	\N	\N
428	32	8	8	\N	2	2016-11-21 08:51:40	\N	\N
430	32	10	8	\N	2	2016-11-21 08:51:40	\N	\N
425	32	5	9	\N	3	2016-11-21 08:51:40	\N	\N
435	32	15	6	\N	3	2016-11-21 08:51:40	\N	\N
427	32	7	8	\N	3	2016-11-21 08:51:40	\N	\N
423	32	3	10	\N	2	2016-11-21 08:51:40	\N	\N
429	32	9	8	\N	3	2016-11-21 08:51:40	\N	\N
450	34	5	9	\N	3	2016-11-23 08:55:09	\N	\N
443	33	8	1	\N	3	2016-11-21 12:42:58	\N	\N
490	37	10	6	\N	3	2016-11-25 00:26:00	\N	\N
481	37	1	9	\N	3	2016-11-25 00:26:00	\N	\N
497	38	7	9	\N	3	2016-11-25 14:55:53	\N	\N
500	38	10	9	\N	3	2016-11-25 14:55:53	\N	\N
499	38	9	9	\N	3	2016-11-25 14:55:53	\N	\N
486	37	6	9	\N	2	2016-11-25 00:26:00	\N	\N
501	38	11	9	\N	\N	2016-11-25 14:55:53	\N	\N
493	38	3	11	\N	2	2016-11-25 14:55:53	\N	\N
454	34	9	7	\N	3	2016-11-23 08:55:09	\N	\N
455	34	10	6	\N	3	2016-11-23 08:55:09	\N	\N
448	34	3	9	\N	2	2016-11-23 08:55:09	\N	\N
494	38	4	10	\N	2	2016-11-25 14:55:53	\N	\N
452	34	7	8	\N	3	2016-11-23 08:55:09	\N	\N
488	37	8	8	\N	3	2016-11-25 00:26:00	\N	\N
482	37	2	9	\N	2	2016-11-25 00:26:00	\N	\N
453	34	8	8	\N	3	2016-11-23 08:55:09	\N	\N
495	38	5	10	\N	2	2016-11-25 14:55:53	\N	\N
446	34	1	9	\N	3	2016-11-23 08:55:09	\N	\N
469	35	14	7	\N	3	2016-11-23 16:10:14	\N	\N
470	35	15	6	\N	3	2016-11-23 16:10:14	\N	\N
468	35	13	8	\N	3	2016-11-23 16:10:14	\N	\N
462	35	7	9	\N	3	2016-11-23 16:10:13	\N	\N
461	35	6	9	\N	3	2016-11-23 16:10:13	\N	\N
463	35	8	9	\N	3	2016-11-23 16:10:14	\N	\N
459	35	4	10	\N	2	2016-11-23 16:10:13	\N	\N
467	35	12	8	\N	3	2016-11-23 16:10:14	\N	\N
484	37	4	9	pekka walk prévu !	3	2016-11-25 00:26:00	\N	\N
512	39	7	9	\N	3	2016-11-26 22:58:39	\N	\N
487	37	7	9	\N	2	2016-11-25 00:26:00	\N	\N
496	38	6	9	\N	2	2016-11-25 14:55:53	\N	\N
504	38	14	6	\N	3	2016-11-25 14:55:53	\N	\N
491	38	1	11	\N	2	2016-11-25 14:55:53	\N	\N
451	34	6	9	\N	3	2016-11-23 08:55:09	\N	\N
449	34	4	9	\N	3	2016-11-23 08:55:09	\N	\N
489	37	9	7	\N	3	2016-11-25 00:26:00	\N	\N
502	38	12	7	\N	3	2016-11-25 14:55:53	\N	\N
503	38	13	7	\N	3	2016-11-25 14:55:53	\N	\N
492	38	2	11	\N	1	2016-11-25 14:55:53	\N	\N
505	38	15	5	\N	3	2016-11-25 14:55:53	\N	\N
498	38	8	9	\N	3	2016-11-25 14:55:53	\N	\N
485	37	5	9	\N	3	2016-11-25 00:26:00	\N	\N
516	39	11	8	\N	3	2016-11-26 22:58:39	\N	\N
525	40	5	1	\N	2	2016-11-27 00:05:59	\N	\N
507	39	2	11	\N	2	2016-11-26 22:58:39	\N	\N
523	40	3	1	\N	2	2016-11-27 00:05:59	\N	\N
517	39	12	8	\N	3	2016-11-26 22:58:39	\N	\N
522	40	2	1	\N	3	2016-11-27 00:05:59	\N	\N
511	39	6	9	\N	3	2016-11-26 22:58:39	\N	\N
524	40	4	1	\N	3	2016-11-27 00:05:59	\N	\N
529	40	9	1	\N	3	2016-11-27 00:05:59	\N	\N
514	39	9	9	\N	3	2016-11-26 22:58:39	\N	\N
508	39	3	11	\N	1	2016-11-26 22:58:39	\N	\N
509	39	4	11	\N	3	2016-11-26 22:58:39	\N	\N
527	40	7	1	\N	3	2016-11-27 00:05:59	\N	\N
526	40	6	1	\N	3	2016-11-27 00:05:59	\N	\N
515	39	10	8	\N	3	2016-11-26 22:58:39	\N	\N
518	39	13	7	\N	3	2016-11-26 22:58:39	\N	\N
506	39	1	11	\N	1	2016-11-26 22:58:39	\N	\N
528	40	8	1	\N	3	2016-11-27 00:05:59	\N	\N
530	40	10	1	\N	3	2016-11-27 00:05:59	\N	\N
520	39	15	7	\N	3	2016-11-26 22:58:39	\N	\N
513	39	8	9	\N	3	2016-11-26 22:58:39	\N	\N
519	39	14	7	\N	3	2016-11-26 22:58:39	\N	\N
510	39	5	10	\N	2	2016-11-26 22:58:39	\N	\N
521	40	1	1	\N	2	2016-11-27 00:05:59	\N	\N
559	43	4	10	\N	2	2016-11-30 23:03:53	\N	\N
612	48	2	11	\N	1	2016-12-05 08:06:31	\N	\N
561	43	6	10	\N	2	2016-11-30 23:03:53	\N	\N
558	43	3	10	\N	2	2016-11-30 23:03:53	\N	\N
569	43	14	8	\N	3	2016-11-30 23:03:53	\N	\N
567	43	12	8	\N	3	2016-11-30 23:03:53	\N	\N
560	43	5	10	\N	2	2016-11-30 23:03:53	\N	\N
564	43	9	9	\N	3	2016-11-30 23:03:53	\N	\N
568	43	13	8	attaquera en début d'après midi pour raison professionnelle	3	2016-11-30 23:03:53	\N	\N
570	43	15	8	\N	3	2016-11-30 23:03:53	\N	\N
596	46	6	9	\N	3	2016-12-02 22:49:34	\N	\N
610	47	10	1	\N	3	2016-12-02 22:49:40	\N	\N
563	43	8	10	\N	2	2016-11-30 23:03:53	\N	\N
609	47	9	1	\N	3	2016-12-02 22:49:40	\N	\N
546	42	1	1	\N	\N	2016-11-29 09:52:53	\N	\N
549	42	4	1	\N	\N	2016-11-29 09:52:53	\N	\N
550	42	5	1	\N	\N	2016-11-29 09:52:53	\N	\N
536	41	6	10	\N	3	2016-11-29 09:23:12	\N	\N
565	43	10	9	\N	3	2016-11-30 23:03:53	\N	\N
548	42	3	9	\N	2	2016-11-29 09:52:53	\N	\N
535	41	5	10	\N	2	2016-11-29 09:23:12	\N	\N
538	41	8	10	\N	3	2016-11-29 09:23:12	\N	\N
540	41	10	9	\N	3	2016-11-29 09:23:12	\N	\N
544	41	14	8	\N	3	2016-11-29 09:23:12	\N	\N
543	41	13	8	\N	3	2016-11-29 09:23:12	\N	\N
545	41	15	8	\N	3	2016-11-29 09:23:12	\N	\N
566	43	11	8	\N	3	2016-11-30 23:03:53	\N	\N
555	42	10	1	\N	3	2016-11-29 09:52:53	\N	\N
554	42	9	1	\N	3	2016-11-29 09:52:53	\N	\N
574	44	4	1	\N	2	2016-12-01 11:44:08	\N	\N
603	47	3	1	\N	2	2016-12-02 22:49:40	\N	\N
539	41	9	9	\N	3	2016-11-29 09:23:12	\N	\N
537	41	7	10	\N	2	2016-11-29 09:23:12	\N	\N
576	44	6	1	\N	3	2016-12-01 11:44:08	\N	\N
531	41	1	11	\N	2	2016-11-29 09:23:12	\N	\N
551	42	6	1	\N	1	2016-11-29 09:52:53	\N	\N
533	41	3	10	\N	2	2016-11-29 09:23:12	\N	\N
553	42	8	1	\N	3	2016-11-29 09:52:53	\N	\N
547	42	2	1	\N	3	2016-11-29 09:52:53	\N	\N
532	41	2	11	\N	1	2016-11-29 09:23:12	\N	\N
534	41	4	10	\N	1	2016-11-29 09:23:12	\N	\N
541	41	11	8	\N	3	2016-11-29 09:23:12	\N	\N
542	41	12	9	\N	3	2016-11-29 09:23:12	\N	\N
552	42	7	1	\N	3	2016-11-29 09:52:53	\N	\N
556	43	1	11	\N	\N	2016-11-30 23:03:53	\N	\N
604	47	4	1	\N	2	2016-12-02 22:49:40	\N	\N
599	46	9	7	\N	3	2016-12-02 22:49:34	\N	\N
600	46	10	6	\N	3	2016-12-02 22:49:34	\N	\N
595	46	5	9	\N	3	2016-12-02 22:49:34	\N	\N
593	46	3	10	\N	2	2016-12-02 22:49:34	\N	\N
647	50	12	1	\N	2	2016-12-05 19:21:25	\N	\N
602	47	2	9	\N	1	2016-12-02 22:49:40	\N	\N
598	46	8	9	\N	3	2016-12-02 22:49:34	\N	\N
614	48	4	10	\N	2	2016-12-05 08:06:31	\N	\N
642	50	7	1	\N	2	2016-12-05 19:21:25	\N	\N
577	44	7	1	\N	2	2016-12-01 11:44:08	\N	\N
601	47	1	9	\N	2	2016-12-02 22:49:40	\N	\N
613	48	3	10	\N	2	2016-12-05 08:06:31	\N	\N
607	47	7	1	\N	2	2016-12-02 22:49:40	\N	\N
572	44	2	1	\N	\N	2016-12-01 11:44:08	\N	\N
578	44	8	1	\N	3	2016-12-01 11:44:08	\N	\N
579	44	9	1	\N	3	2016-12-01 11:44:08	\N	\N
580	44	10	1	\N	3	2016-12-01 11:44:08	\N	\N
608	47	8	1	\N	3	2016-12-02 22:49:40	\N	\N
573	44	3	9	\N	2	2016-12-01 11:44:08	\N	\N
562	43	7	10	\N	2	2016-11-30 23:03:53	\N	\N
571	44	1	1	\N	2	2016-12-01 11:44:08	\N	\N
575	44	5	1	\N	3	2016-12-01 11:44:08	\N	\N
557	43	2	11	\N	1	2016-11-30 23:03:53	\N	\N
605	47	5	1	\N	\N	2016-12-02 22:49:40	\N	\N
704	54	9	9	\N	2	2016-12-07 19:08:06	\N	\N
620	48	10	8	\N	3	2016-12-05 08:06:31	\N	\N
616	48	6	9	\N	3	2016-12-05 08:06:31	\N	\N
618	48	8	8	\N	3	2016-12-05 08:06:31	\N	\N
606	47	6	1	\N	1	2016-12-02 22:49:40	\N	\N
594	46	4	9	\N	2	2016-12-02 22:49:34	\N	\N
597	46	7	9	\N	3	2016-12-02 22:49:34	\N	\N
615	48	5	9	\N	3	2016-12-05 08:06:31	\N	\N
637	50	2	1	\N	\N	2016-12-05 19:21:25	\N	\N
639	50	4	1	\N	\N	2016-12-05 19:21:25	\N	\N
649	50	14	1	\N	\N	2016-12-05 19:21:25	\N	\N
650	50	15	1	\N	\N	2016-12-05 19:21:25	\N	\N
591	46	1	11	\N	2	2016-12-02 22:49:34	\N	\N
619	48	9	8	\N	3	2016-12-05 08:06:31	\N	\N
592	46	2	10	\N	2	2016-12-02 22:49:34	\N	\N
643	50	8	1	\N	3	2016-12-05 19:21:25	\N	\N
641	50	6	1	\N	3	2016-12-05 19:21:25	\N	\N
638	50	3	1	\N	2	2016-12-05 19:21:25	\N	\N
640	50	5	1	\N	1	2016-12-05 19:21:25	\N	\N
644	50	9	1	\N	2	2016-12-05 19:21:25	\N	\N
646	50	11	1	\N	2	2016-12-05 19:21:25	\N	\N
636	50	1	1	\N	\N	2016-12-05 19:21:25	\N	\N
645	50	10	1	\N	3	2016-12-05 19:21:25	\N	\N
648	50	13	1	\N	3	2016-12-05 19:21:25	\N	\N
611	48	1	11	\N	0	2016-12-05 08:06:31	\N	\N
617	48	7	9	\N	3	2016-12-05 08:06:31	\N	\N
703	54	8	9	\N	2	2016-12-07 19:08:06	\N	\N
699	54	4	10	\N	\N	2016-12-07 19:08:06	\N	\N
702	54	7	9	\N	3	2016-12-07 19:08:06	\N	\N
698	54	3	10	\N	2	2016-12-07 19:08:06	\N	\N
710	54	15	7	\N	3	2016-12-07 19:08:06	\N	\N
701	54	6	10	\N	2	2016-12-07 19:08:06	\N	\N
709	54	14	7	\N	3	2016-12-07 19:08:06	\N	\N
706	54	11	9	\N	3	2016-12-07 19:08:06	\N	\N
697	54	2	11	\N	0	2016-12-07 19:08:06	\N	\N
708	54	13	7	\N	3	2016-12-07 19:08:06	\N	\N
700	54	5	10	\N	2	2016-12-07 19:08:06	\N	\N
711	55	1	1	\N	\N	2016-12-07 19:29:01	\N	\N
721	55	11	1	\N	3	2016-12-07 19:29:01	\N	\N
725	55	15	1	\N	3	2016-12-07 19:29:01	\N	\N
713	55	3	1	\N	1	2016-12-07 19:29:01	\N	\N
720	55	10	1	\N	3	2016-12-07 19:29:01	\N	\N
719	55	9	1	\N	3	2016-12-07 19:29:01	\N	\N
724	55	14	1	\N	3	2016-12-07 19:29:01	\N	\N
723	55	13	1	\N	3	2016-12-07 19:29:01	\N	\N
696	54	1	11	\N	2	2016-12-07 19:08:06	\N	\N
707	54	12	8	\N	3	2016-12-07 19:08:06	\N	\N
717	55	7	1	\N	2	2016-12-07 19:29:01	\N	\N
716	55	6	1	\N	3	2016-12-07 19:29:01	\N	\N
718	55	8	1	\N	3	2016-12-07 19:29:01	\N	\N
705	54	10	9	\N	3	2016-12-07 19:08:06	\N	\N
712	55	2	1	\N	2	2016-12-07 19:29:01	\N	\N
714	55	4	1	\N	2	2016-12-07 19:29:01	\N	\N
722	55	12	1	\N	3	2016-12-07 19:29:01	\N	\N
715	55	5	1	\N	2	2016-12-07 19:29:01	\N	\N
726	56	1	1	\N	\N	2016-12-09 15:10:22	\N	\N
727	56	2	1	\N	\N	2016-12-09 15:10:22	\N	\N
730	56	5	1	\N	\N	2016-12-09 15:10:22	\N	\N
731	56	6	1	\N	\N	2016-12-09 15:10:22	\N	\N
735	56	10	1	\N	\N	2016-12-09 15:10:22	\N	\N
737	56	12	1	\N	\N	2016-12-09 15:10:22	\N	\N
826	65	1	10	\N	\N	2016-12-11 17:25:26	\N	\N
829	65	4	10	\N	\N	2016-12-11 17:25:26	\N	\N
836	66	1	1	\N	\N	2016-12-11 19:41:22	\N	\N
837	66	2	1	\N	\N	2016-12-11 19:41:22	\N	\N
838	66	3	1	\N	\N	2016-12-11 19:41:22	\N	\N
748	57	8	9	\N	3	2016-12-09 19:09:24	\N	\N
740	56	15	1	\N	3	2016-12-09 15:10:22	\N	\N
753	57	13	8	\N	3	2016-12-09 19:09:24	\N	\N
754	57	14	7	\N	3	2016-12-09 19:09:24	\N	\N
755	57	15	6	\N	3	2016-12-09 19:09:24	\N	\N
752	57	12	8	\N	3	2016-12-09 19:09:24	\N	\N
738	56	13	1	\N	3	2016-12-09 15:10:22	\N	\N
728	56	3	1	\N	2	2016-12-09 15:10:22	\N	\N
729	56	4	1	\N	2	2016-12-09 15:10:22	\N	\N
736	56	11	1	\N	2	2016-12-09 15:10:22	\N	\N
739	56	14	1	\N	3	2016-12-09 15:10:22	\N	\N
732	56	7	1	\N	3	2016-12-09 15:10:22	\N	\N
749	57	9	9	\N	2	2016-12-09 19:09:24	\N	\N
751	57	11	8	\N	3	2016-12-09 19:09:24	\N	\N
733	56	8	1	\N	3	2016-12-09 15:10:22	\N	\N
734	56	9	1	\N	3	2016-12-09 15:10:22	\N	\N
750	57	10	8	\N	3	2016-12-09 19:09:24	\N	\N
741	57	1	11	\N	0	2016-12-09 19:09:24	\N	\N
742	57	2	11	\N	2	2016-12-09 19:09:24	\N	\N
743	57	3	10	\N	2	2016-12-09 19:09:24	\N	\N
744	57	4	10	\N	2	2016-12-09 19:09:24	\N	\N
745	57	5	10	\N	1	2016-12-09 19:09:24	\N	\N
746	57	6	10	\N	2	2016-12-09 19:09:24	\N	\N
747	57	7	9	\N	3	2016-12-09 19:09:24	\N	\N
828	65	3	10	\N	2	2016-12-11 17:25:26	\N	\N
844	66	9	1	\N	1	2016-12-11 19:41:22	\N	\N
840	66	5	1	\N	3	2016-12-11 19:41:22	\N	\N
843	66	8	1	\N	2	2016-12-11 19:41:22	\N	\N
831	65	6	9	\N	3	2016-12-11 17:25:26	\N	\N
835	65	10	6	\N	3	2016-12-11 17:25:26	\N	\N
864	68	9	8	\N	3	2016-12-13 11:49:13	\N	\N
841	66	6	9	\N	2	2016-12-11 19:41:22	\N	\N
830	65	5	9	\N	3	2016-12-11 17:25:26	\N	\N
834	65	9	8	\N	3	2016-12-11 17:25:26	\N	\N
832	65	7	9	\N	3	2016-12-11 17:25:26	\N	\N
833	65	8	9	\N	3	2016-12-11 17:25:26	\N	\N
827	65	2	10	\N	1	2016-12-11 17:25:26	\N	\N
842	66	7	1	\N	3	2016-12-11 19:41:22	\N	\N
839	66	4	1	\N	2	2016-12-11 19:41:22	\N	\N
845	66	10	1	\N	3	2016-12-11 19:41:22	\N	\N
871	69	6	8	\N	2	2016-12-13 12:24:45	\N	\N
872	69	7	8	\N	2	2016-12-13 12:24:45	\N	\N
874	69	9	8	\N	2	2016-12-13 12:24:45	\N	\N
866	69	1	11	\N	2	2016-12-13 12:24:45	\N	\N
861	68	6	10	\N	3	2016-12-13 11:49:13	\N	\N
869	69	4	9	\N	3	2016-12-13 12:24:45	\N	\N
867	69	2	10	\N	2	2016-12-13 12:24:45	\N	\N
875	69	10	7	\N	3	2016-12-13 12:24:45	\N	\N
863	68	8	8	\N	3	2016-12-13 11:49:13	\N	\N
873	69	8	8	\N	3	2016-12-13 12:24:45	\N	\N
862	68	7	9	\N	3	2016-12-13 11:49:13	\N	\N
860	68	5	9	\N	2	2016-12-13 11:49:13	\N	\N
858	68	3	9	\N	2	2016-12-13 11:49:13	\N	\N
870	69	5	9	\N	2	2016-12-13 12:24:45	\N	\N
868	69	3	9	\N	2	2016-12-13 12:24:45	\N	\N
865	68	10	7	\N	3	2016-12-13 11:49:13	\N	\N
856	68	1	10	\N	\N	2016-12-13 11:49:13	\N	\N
857	68	2	10	\N	\N	2016-12-13 11:49:13	\N	\N
859	68	4	9	\N	2	2016-12-13 11:49:13	\N	\N
876	70	1	1	\N	2	2016-12-15 10:42:02	\N	\N
893	71	8	9	\N	3	2016-12-15 12:55:10	\N	\N
889	71	4	10	\N	2	2016-12-15 12:55:10	\N	\N
880	70	5	1	\N	3	2016-12-15 10:42:02	\N	\N
890	71	5	9	\N	1	2016-12-15 12:55:10	\N	\N
895	71	10	8	\N	3	2016-12-15 12:55:10	\N	\N
877	70	2	1	\N	2	2016-12-15 10:42:02	\N	\N
892	71	7	9	\N	3	2016-12-15 12:55:10	\N	\N
896	71	11	8	\N	3	2016-12-15 12:55:10	\N	\N
884	70	9	1	\N	3	2016-12-15 10:42:02	\N	\N
879	70	4	1	\N	3	2016-12-15 10:42:02	\N	\N
886	71	1	11	\N	1	2016-12-15 12:55:10	\N	\N
899	71	14	7	\N	3	2016-12-15 12:55:10	\N	\N
897	71	12	8	\N	3	2016-12-15 12:55:10	\N	\N
894	71	9	8	\N	3	2016-12-15 12:55:10	\N	\N
885	70	10	1	\N	3	2016-12-15 10:42:02	\N	\N
898	71	13	7	\N	3	2016-12-15 12:55:10	\N	\N
900	71	15	6	\N	3	2016-12-15 12:55:10	\N	\N
883	70	8	1	\N	3	2016-12-15 10:42:02	\N	\N
882	70	7	1	\N	3	2016-12-15 10:42:02	\N	\N
881	70	6	1	\N	3	2016-12-15 10:42:02	\N	\N
887	71	2	11	\N	2	2016-12-15 12:55:10	\N	\N
888	71	3	11	\N	3	2016-12-15 12:55:10	\N	\N
891	71	6	9	\N	3	2016-12-15 12:55:10	\N	\N
878	70	3	1	\N	1	2016-12-15 10:42:02	\N	\N
902	72	2	11	\N	2	2016-12-16 22:52:14	\N	\N
973	78	8	1	\N	3	2016-12-23 08:53:57	\N	\N
971	78	6	1	\N	2	2016-12-23 08:53:57	\N	\N
972	78	7	1	\N	1	2016-12-23 08:53:57	\N	\N
967	78	2	1	\N	3	2016-12-23 08:53:57	\N	\N
975	78	10	1	\N	3	2016-12-23 08:53:57	\N	\N
974	78	9	1	\N	3	2016-12-23 08:53:57	\N	\N
969	78	4	1	\N	3	2016-12-23 08:53:57	\N	\N
968	78	3	1	\N	2	2016-12-23 08:53:57	\N	\N
917	73	7	1	\N	3	2016-12-17 19:42:34	\N	\N
919	73	9	1	\N	3	2016-12-17 19:42:34	\N	\N
905	72	5	9	\N	3	2016-12-16 22:52:14	\N	\N
906	72	6	9	\N	3	2016-12-16 22:52:14	\N	\N
907	72	7	9	\N	3	2016-12-16 22:52:14	\N	\N
910	72	10	7	\N	3	2016-12-16 22:52:14	\N	\N
909	72	9	8	\N	1	2016-12-16 22:52:14	\N	\N
904	72	4	9	\N	3	2016-12-16 22:52:14	\N	\N
908	72	8	8	\N	3	2016-12-16 22:52:14	\N	\N
912	73	2	1	\N	2	2016-12-17 19:42:34	\N	\N
901	72	1	11	\N	3	2016-12-16 22:52:14	\N	\N
903	72	3	10	\N	3	2016-12-16 22:52:14	\N	\N
911	73	1	1	\N	2	2016-12-17 19:42:34	\N	\N
913	73	3	1	\N	2	2016-12-17 19:42:34	\N	\N
915	73	5	1	\N	2	2016-12-17 19:42:34	\N	\N
916	73	6	1	\N	3	2016-12-17 19:42:34	\N	\N
918	73	8	1	\N	3	2016-12-17 19:42:34	\N	\N
920	73	10	1	\N	3	2016-12-17 19:42:34	\N	\N
914	73	4	1	\N	3	2016-12-17 19:42:34	\N	\N
921	74	1	1	\N	\N	2016-12-19 13:08:28	\N	\N
925	74	5	1	\N	\N	2016-12-19 13:08:28	\N	\N
928	74	8	1	\N	\N	2016-12-19 13:08:28	\N	\N
956	77	1	1	\N	\N	2016-12-21 12:41:57	\N	\N
957	77	2	1	\N	\N	2016-12-21 12:41:57	\N	\N
929	74	9	1	\N	3	2016-12-19 13:08:28	\N	\N
930	74	10	1	\N	3	2016-12-19 13:08:28	\N	\N
935	75	5	9	\N	2	2016-12-19 22:24:04	\N	\N
922	74	2	1	\N	2	2016-12-19 13:08:28	\N	\N
923	74	3	1	\N	3	2016-12-19 13:08:28	\N	\N
927	74	7	1	\N	3	2016-12-19 13:08:28	\N	\N
933	75	3	11	\N	2	2016-12-19 22:24:04	\N	\N
932	75	2	11	\N	2	2016-12-19 22:24:04	\N	\N
938	75	8	8	\N	3	2016-12-19 22:24:04	\N	\N
937	75	7	8	\N	3	2016-12-19 22:24:04	\N	\N
940	75	10	6	\N	3	2016-12-19 22:24:04	\N	\N
934	75	4	9	\N	3	2016-12-19 22:24:04	\N	\N
931	75	1	11	\N	1	2016-12-19 22:24:04	\N	\N
939	75	9	8	\N	3	2016-12-19 22:24:04	\N	\N
926	74	6	1	\N	3	2016-12-19 13:08:28	\N	\N
936	75	6	9	\N	3	2016-12-19 22:24:04	\N	\N
924	74	4	1	\N	2	2016-12-19 13:08:28	\N	\N
941	76	1	11	\N	\N	2016-12-21 10:56:38	\N	\N
943	76	3	10	\N	3	2016-12-21 10:56:38	\N	\N
954	76	14	7	\N	3	2016-12-21 10:56:38	\N	\N
955	76	15	7	\N	3	2016-12-21 10:56:38	\N	\N
944	76	4	9	\N	2	2016-12-21 10:56:38	\N	\N
946	76	6	9	\N	2	2016-12-21 10:56:38	\N	\N
963	77	8	1	\N	3	2016-12-21 12:41:57	\N	\N
948	76	8	9	\N	3	2016-12-21 10:56:38	\N	\N
979	79	4	10	\N	2	2016-12-29 07:51:27	\N	\N
953	76	13	8	\N	3	2016-12-21 10:56:38	\N	\N
952	76	12	8	\N	3	2016-12-21 10:56:38	\N	\N
951	76	11	8	\N	3	2016-12-21 10:56:38	\N	\N
949	76	9	9	76% 2 étoiles	3	2016-12-21 10:56:38	\N	\N
942	76	2	11	\N	2	2016-12-21 10:56:38	\N	\N
994	80	9	9	\N	3	2017-01-03 08:55:07	\N	\N
964	77	9	1	\N	3	2016-12-21 12:41:57	\N	\N
962	77	7	1	\N	1	2016-12-21 12:41:57	\N	\N
961	77	6	1	\N	3	2016-12-21 12:41:57	\N	\N
960	77	5	1	\N	3	2016-12-21 12:41:57	\N	\N
959	77	4	1	\N	3	2016-12-21 12:41:57	\N	\N
958	77	3	1	\N	2	2016-12-21 12:41:57	\N	\N
965	77	10	1	\N	3	2016-12-21 12:41:57	\N	\N
950	76	10	9	\N	3	2016-12-21 10:56:38	\N	\N
947	76	7	10	\N	3	2016-12-21 10:56:38	\N	\N
945	76	5	10	\N	2	2016-12-21 10:56:38	\N	\N
966	78	1	1	\N	\N	2016-12-23 08:53:57	\N	\N
970	78	5	1	\N	\N	2016-12-23 08:53:57	\N	\N
1000	80	15	9	\N	3	2017-01-03 08:55:07	\N	\N
993	80	8	9	\N	3	2017-01-03 08:55:07	\N	\N
978	79	3	10	\N	3	2016-12-29 07:51:27	\N	\N
986	80	1	11	\N	2	2017-01-03 08:55:07	\N	\N
981	79	6	10	\N	2	2016-12-29 07:51:27	\N	\N
995	80	10	9	\N	3	2017-01-03 08:55:07	\N	\N
984	79	9	9	\N	3	2016-12-29 07:51:27	\N	\N
990	80	5	10	\N	2	2017-01-03 08:55:07	\N	\N
982	79	7	10	\N	3	2016-12-29 07:51:27	\N	\N
980	79	5	10	\N	2	2016-12-29 07:51:27	\N	\N
1008	80	23	8	\N	3	2017-01-03 08:55:07	\N	\N
983	79	8	9	\N	3	2016-12-29 07:51:27	\N	\N
985	79	10	8	\N	3	2016-12-29 07:51:27	\N	\N
977	79	2	11	\N	2	2016-12-29 07:51:27	\N	\N
976	79	1	11	\N	2	2016-12-29 07:51:27	\N	\N
996	80	11	9	\N	3	2017-01-03 08:55:07	\N	\N
1001	80	16	9	\N	3	2017-01-03 08:55:07	\N	\N
989	80	4	11	\N	2	2017-01-03 08:55:07	\N	\N
999	80	14	9	\N	3	2017-01-03 08:55:07	\N	\N
998	80	13	9	\N	3	2017-01-03 08:55:07	\N	\N
991	80	6	9	\N	3	2017-01-03 08:55:07	\N	\N
988	80	3	10	\N	2	2017-01-03 08:55:07	\N	\N
1009	80	24	8	\N	3	2017-01-03 08:55:07	\N	\N
1003	80	18	9	\N	3	2017-01-03 08:55:07	\N	\N
1007	80	22	8	\N	3	2017-01-03 08:55:07	\N	\N
997	80	12	9	\N	3	2017-01-03 08:55:07	\N	\N
1004	80	19	9	\N	3	2017-01-03 08:55:07	\N	\N
987	80	2	10	\N	2	2017-01-03 08:55:07	\N	\N
1006	80	21	9	\N	3	2017-01-03 08:55:07	\N	\N
992	80	7	9	\N	2	2017-01-03 08:55:07	\N	\N
1005	80	20	9	\N	3	2017-01-03 08:55:07	\N	\N
1002	80	17	9	\N	3	2017-01-03 08:55:07	\N	\N
1010	80	25	8	\N	3	2017-01-03 08:55:07	\N	\N
1021	81	11	10	\N	\N	2017-01-05 09:39:10	\N	\N
1020	81	10	10	\N	\N	2017-01-05 09:39:10	\N	\N
1019	81	9	10	\N	\N	2017-01-05 09:39:10	\N	\N
1018	81	8	10	\N	\N	2017-01-05 09:39:10	\N	\N
1017	81	7	10	\N	\N	2017-01-05 09:39:10	\N	\N
1016	81	6	10	\N	\N	2017-01-05 09:39:10	\N	\N
1015	81	5	10	\N	\N	2017-01-05 09:39:10	\N	\N
1014	81	4	10	\N	\N	2017-01-05 09:39:10	\N	\N
1013	81	3	10	\N	\N	2017-01-05 09:39:10	\N	\N
1012	81	2	10	\N	\N	2017-01-05 09:39:10	\N	\N
1011	81	1	10	\N	\N	2017-01-05 09:39:10	\N	\N
1023	81	13	9	\N	\N	2017-01-05 09:39:10	\N	\N
1022	81	12	9	\N	\N	2017-01-05 09:39:10	\N	\N
1025	81	15	10	\N	\N	2017-01-05 09:39:10	\N	\N
1024	81	14	10	\N	\N	2017-01-05 09:39:10	\N	\N
1040	81	30	9	\N	\N	2017-01-05 09:39:10	\N	\N
1039	81	29	9	\N	\N	2017-01-05 09:39:10	\N	\N
1038	81	28	9	\N	\N	2017-01-05 09:39:10	\N	\N
1037	81	27	9	\N	\N	2017-01-05 09:39:10	\N	\N
1036	81	26	9	\N	\N	2017-01-05 09:39:10	\N	\N
1035	81	25	9	\N	\N	2017-01-05 09:39:10	\N	\N
1034	81	24	9	\N	\N	2017-01-05 09:39:10	\N	\N
1033	81	23	9	\N	\N	2017-01-05 09:39:10	\N	\N
1032	81	22	9	\N	\N	2017-01-05 09:39:10	\N	\N
1030	81	20	9	\N	\N	2017-01-05 09:39:10	\N	\N
1029	81	19	9	\N	\N	2017-01-05 09:39:10	\N	\N
1028	81	18	9	\N	\N	2017-01-05 09:39:10	\N	\N
1027	81	17	9	\N	\N	2017-01-05 09:39:10	\N	\N
1026	81	16	9	\N	\N	2017-01-05 09:39:10	\N	\N
1031	81	21	10	\N	\N	2017-01-05 09:39:10	\N	\N
1049	81	39	8	\N	\N	2017-01-05 09:39:10	\N	\N
1048	81	38	8	\N	\N	2017-01-05 09:39:10	\N	\N
1047	81	37	8	\N	\N	2017-01-05 09:39:10	\N	\N
1045	81	35	8	\N	\N	2017-01-05 09:39:10	\N	\N
1044	81	34	8	\N	\N	2017-01-05 09:39:10	\N	\N
1043	81	33	8	\N	\N	2017-01-05 09:39:10	\N	\N
1042	81	32	8	\N	\N	2017-01-05 09:39:10	\N	\N
1041	81	31	8	\N	\N	2017-01-05 09:39:10	\N	\N
1050	81	40	6	\N	\N	2017-01-05 09:39:10	\N	\N
1046	81	36	9	\N	\N	2017-01-05 09:39:10	\N	\N
\.


--
-- Name: target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('target_id_seq', 1065, true);


--
-- Data for Name: war; Type: TABLE DATA; Schema: public; Owner: gus
--

COPY war (id, bzh_clan_id, vs_clan_id, code, size, date_start, date_end, date_creation, date_maj, stars_bzh, stars_vs, destruction_bzh, destruction_vs, result) FROM stdin;
19	8	21	056b	20	2016-11-11 22:02:29	2016-11-12 22:02:29	2016-11-11 09:45:29	\N	50	44	87.2000000000000028	84.3499999999999943	V
21	8	23	045a	20	2016-11-13 21:54:12	2016-11-14 21:54:12	2016-11-13 09:24:10	\N	51	53	91.0999999999999943	88.5499999999999972	D
23	8	25	2461	20	2016-11-15 22:18:43	2016-11-16 22:18:43	2016-11-15 10:33:43	\N	57	44	95.0499999999999972	82.5499999999999972	V
22	9	24	bf79	10	2016-11-14 20:25:51	2016-11-15 20:25:51	2016-11-14 15:10:51	\N	25	26	83.0999999999999943	94	D
27	8	29	1a44	15	2016-11-17 21:58:47	2016-11-18 21:58:47	2016-11-17 07:24:47	\N	41	41	90.6700000000000017	90.4000000000000057	V
28	8	30	65e8	15	2016-11-19 22:02:46	2016-11-20 22:02:46	2016-11-19 12:47:45	\N	39	40	87.7999999999999972	92.1299999999999955	D
32	8	34	ada8	15	2016-11-21 21:26:39	2016-11-22 21:26:39	2016-11-21 08:51:39	\N	41	43	89.3299999999999983	95.1299999999999955	D
26	9	28	1af4	10	2016-11-17 21:18:25	2016-11-18 21:18:25	2016-11-16 22:58:24	\N	29	24	99.4000000000000057	83	V
31	9	33	5bf2	10	2016-11-19 21:25:40	2016-11-20 21:25:40	2016-11-19 15:37:40	\N	28	28	96.7999999999999972	92.7000000000000028	V
33	9	35	f193	10	2016-11-21 21:10:58	2016-11-22 21:10:58	2016-11-21 12:42:58	\N	26	13	91.4000000000000057	43.2999999999999972	V
34	9	36	9883	10	2016-11-23 21:22:09	2016-11-24 21:22:09	2016-11-23 08:55:08	\N	28	26	98	92.2999999999999972	V
35	8	37	036e	15	2016-11-23 21:15:13	2016-11-24 21:15:13	2016-11-23 16:10:13	\N	40	38	87.9300000000000068	88.4000000000000057	V
37	9	39	e37c	10	2016-11-25 21:38:59	2016-11-26 21:38:59	2016-11-25 00:25:59	\N	26	25	90.7000000000000028	87.5999999999999943	V
38	8	40	b111	15	2016-11-25 22:00:52	2016-11-26 22:00:52	2016-11-25 14:55:52	\N	38	35	88.269999999999996	82.1299999999999955	V
39	8	41	6635	15	2016-11-27 21:31:39	2016-11-28 21:31:39	2016-11-26 22:58:39	\N	39	34	93.6700000000000017	79.730000000000004	V
41	8	43	d184	15	2016-11-29 21:39:11	2016-11-30 21:39:11	2016-11-29 09:23:11	\N	37	36	90.3299999999999983	83.8700000000000045	V
43	8	45	2807	15	2016-12-01 21:42:52	2016-12-02 21:42:52	2016-11-30 23:03:52	\N	35	38	80.269999999999996	90.6700000000000017	D
46	8	48	30d4	10	2016-12-03 21:39:34	2016-12-04 21:39:34	2016-12-02 22:49:34	\N	26	21	88.7000000000000028	80.0999999999999943	V
48	8	50	62ec	10	2016-12-05 21:59:31	2016-12-06 21:59:31	2016-12-05 08:06:30	\N	23	22	82.0999999999999943	72.4000000000000057	V
77	9	79	ae1b	10	2016-12-21 21:36:57	2016-12-22 21:36:57	2016-12-21 12:41:57	\N	26	28	88.7000000000000028	95.4000000000000057	D
54	8	56	e9c7	15	2016-12-07 22:20:06	2016-12-08 22:20:06	2016-12-07 19:08:06	\N	36	37	85	85.8700000000000045	D
57	8	59	39a1	15	2016-12-09 21:35:24	2016-12-10 21:35:24	2016-12-09 19:09:24	\N	38	36	87.8700000000000045	81.8700000000000045	V
65	8	67	9852	10	2016-12-11 21:58:25	2016-12-12 21:58:25	2016-12-11 17:25:24	\N	25	25	83.9000000000000057	86.9000000000000057	D
69	8	71	55d4	10	2016-12-13 21:42:08	2016-12-14 21:42:08	2016-12-13 12:24:44	\N	24	27	89.2999999999999972	93.2000000000000028	D
73	9	75	9d4b	10	2016-12-17 22:03:34	2016-12-18 22:03:34	2016-12-17 19:42:34	\N	26	21	92.2999999999999972	75	V
70	9	72	02be	10	2016-12-15 22:06:01	2016-12-16 22:06:01	2016-12-15 10:42:01	\N	26	26	87.4000000000000057	88.2999999999999972	D
68	9	70	0279	10	2016-12-13 21:59:13	2016-12-14 21:59:13	2016-12-13 11:49:13	\N	24	22	90.2000000000000028	78.7999999999999972	V
66	9	68	ed39	10	2016-12-11 21:21:21	2016-12-12 21:21:21	2016-12-11 19:41:21	\N	24	24	85.2000000000000028	86.0999999999999943	D
56	9	58	693b	15	2016-12-09 22:10:21	2016-12-10 22:10:21	2016-12-09 15:10:21	\N	39	41	86.4699999999999989	92.8700000000000045	D
55	9	57	412c	15	2016-12-07 22:12:01	2016-12-08 22:12:01	2016-12-07 19:29:00	\N	37	28	86.9300000000000068	66.8700000000000045	V
50	9	52	f9bb	15	2016-12-05 22:04:25	2016-12-06 22:04:25	2016-12-05 19:21:25	\N	37	39	88.9300000000000068	89.730000000000004	D
47	9	49	2623	10	2016-12-03 21:19:40	2016-12-04 21:19:40	2016-12-02 22:49:40	\N	25	26	85.7999999999999972	90.7999999999999972	D
44	9	46	a84d	10	2016-12-01 21:04:08	2016-12-02 21:04:08	2016-12-01 11:44:07	\N	26	26	88	91.9000000000000057	D
42	9	44	8e17	10	2016-11-29 21:26:53	2016-11-30 21:26:53	2016-11-29 09:52:53	\N	27	27	90.5999999999999943	95.2000000000000028	D
40	9	42	e50c	10	2016-11-27 21:23:59	2016-11-28 21:23:59	2016-11-27 00:05:58	\N	27	22	93.5	81.0999999999999943	V
71	8	73	812b	15	2016-12-15 21:01:10	2016-12-16 21:01:10	2016-12-15 12:55:10	\N	41	20	93.3299999999999983	56.759999999999998	V
72	8	74	8d9a	10	2016-12-17 21:39:14	2016-12-18 21:39:14	2016-12-16 22:52:13	\N	29	19	97	70.7999999999999972	V
75	8	77	445b	10	2016-12-19 22:49:04	2016-12-20 22:49:04	2016-12-19 22:24:04	\N	27	26	90.7999999999999972	84.2999999999999972	V
76	8	78	1287	15	2016-12-21 22:15:38	2016-12-22 22:15:38	2016-12-21 10:56:38	\N	40	36	91.0699999999999932	86.9300000000000068	V
79	8	81	9802	10	2016-12-29 21:01:27	2016-12-30 21:01:27	2016-12-29 07:51:27	\N	25	6	82.4000000000000057	24	V
78	9	80	b5b0	10	2016-12-23 22:44:56	2016-12-24 22:44:56	2016-12-23 08:53:55	\N	25	25	88.0999999999999943	88.2000000000000028	D
74	9	76	2736	10	2016-12-19 22:20:28	2016-12-20 22:20:28	2016-12-19 13:08:27	\N	26	22	86.4000000000000057	78.2999999999999972	V
80	8	82	51f6	25	2017-01-03 21:48:07	2017-01-04 21:48:07	2017-01-03 08:55:05	\N	69	65	93.0799999999999983	92.0400000000000063	V
81	8	83	552e	40	2017-01-05 22:58:10	2017-01-06 22:58:10	2017-01-05 09:39:09	\N	0	0	0	0	\N
\.


--
-- Name: war_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gus
--

SELECT pg_catalog.setval('war_id_seq', 82, true);


--
-- Name: attack_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY attack
    ADD CONSTRAINT attack_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: clan_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY clan
    ADD CONSTRAINT clan_pkey PRIMARY KEY (id);


--
-- Name: image_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: phpbb_acl_options_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_acl_options
    ADD CONSTRAINT phpbb_acl_options_pkey PRIMARY KEY (auth_option_id);


--
-- Name: phpbb_acl_roles_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_acl_roles_data
    ADD CONSTRAINT phpbb_acl_roles_data_pkey PRIMARY KEY (role_id, auth_option_id);


--
-- Name: phpbb_acl_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_acl_roles
    ADD CONSTRAINT phpbb_acl_roles_pkey PRIMARY KEY (role_id);


--
-- Name: phpbb_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_attachments
    ADD CONSTRAINT phpbb_attachments_pkey PRIMARY KEY (attach_id);


--
-- Name: phpbb_banlist_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_banlist
    ADD CONSTRAINT phpbb_banlist_pkey PRIMARY KEY (ban_id);


--
-- Name: phpbb_bbcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_bbcodes
    ADD CONSTRAINT phpbb_bbcodes_pkey PRIMARY KEY (bbcode_id);


--
-- Name: phpbb_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_bookmarks
    ADD CONSTRAINT phpbb_bookmarks_pkey PRIMARY KEY (topic_id, user_id);


--
-- Name: phpbb_bots_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_bots
    ADD CONSTRAINT phpbb_bots_pkey PRIMARY KEY (bot_id);


--
-- Name: phpbb_config_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_config
    ADD CONSTRAINT phpbb_config_pkey PRIMARY KEY (config_name);


--
-- Name: phpbb_config_text_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_config_text
    ADD CONSTRAINT phpbb_config_text_pkey PRIMARY KEY (config_name);


--
-- Name: phpbb_confirm_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_confirm
    ADD CONSTRAINT phpbb_confirm_pkey PRIMARY KEY (session_id, confirm_id);


--
-- Name: phpbb_disallow_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_disallow
    ADD CONSTRAINT phpbb_disallow_pkey PRIMARY KEY (disallow_id);


--
-- Name: phpbb_drafts_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_drafts
    ADD CONSTRAINT phpbb_drafts_pkey PRIMARY KEY (draft_id);


--
-- Name: phpbb_extension_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_extension_groups
    ADD CONSTRAINT phpbb_extension_groups_pkey PRIMARY KEY (group_id);


--
-- Name: phpbb_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_extensions
    ADD CONSTRAINT phpbb_extensions_pkey PRIMARY KEY (extension_id);


--
-- Name: phpbb_forums_access_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_forums_access
    ADD CONSTRAINT phpbb_forums_access_pkey PRIMARY KEY (forum_id, user_id, session_id);


--
-- Name: phpbb_forums_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_forums
    ADD CONSTRAINT phpbb_forums_pkey PRIMARY KEY (forum_id);


--
-- Name: phpbb_forums_track_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_forums_track
    ADD CONSTRAINT phpbb_forums_track_pkey PRIMARY KEY (user_id, forum_id);


--
-- Name: phpbb_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_groups
    ADD CONSTRAINT phpbb_groups_pkey PRIMARY KEY (group_id);


--
-- Name: phpbb_icons_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_icons
    ADD CONSTRAINT phpbb_icons_pkey PRIMARY KEY (icons_id);


--
-- Name: phpbb_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_lang
    ADD CONSTRAINT phpbb_lang_pkey PRIMARY KEY (lang_id);


--
-- Name: phpbb_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_log
    ADD CONSTRAINT phpbb_log_pkey PRIMARY KEY (log_id);


--
-- Name: phpbb_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_migrations
    ADD CONSTRAINT phpbb_migrations_pkey PRIMARY KEY (migration_name);


--
-- Name: phpbb_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_modules
    ADD CONSTRAINT phpbb_modules_pkey PRIMARY KEY (module_id);


--
-- Name: phpbb_notification_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_notification_types
    ADD CONSTRAINT phpbb_notification_types_pkey PRIMARY KEY (notification_type_id);


--
-- Name: phpbb_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_notifications
    ADD CONSTRAINT phpbb_notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: phpbb_oauth_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_oauth_accounts
    ADD CONSTRAINT phpbb_oauth_accounts_pkey PRIMARY KEY (user_id, provider);


--
-- Name: phpbb_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_posts
    ADD CONSTRAINT phpbb_posts_pkey PRIMARY KEY (post_id);


--
-- Name: phpbb_privmsgs_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_privmsgs_folder
    ADD CONSTRAINT phpbb_privmsgs_folder_pkey PRIMARY KEY (folder_id);


--
-- Name: phpbb_privmsgs_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_privmsgs
    ADD CONSTRAINT phpbb_privmsgs_pkey PRIMARY KEY (msg_id);


--
-- Name: phpbb_privmsgs_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_privmsgs_rules
    ADD CONSTRAINT phpbb_privmsgs_rules_pkey PRIMARY KEY (rule_id);


--
-- Name: phpbb_profile_fields_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_profile_fields_data
    ADD CONSTRAINT phpbb_profile_fields_data_pkey PRIMARY KEY (user_id);


--
-- Name: phpbb_profile_fields_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_profile_fields_lang
    ADD CONSTRAINT phpbb_profile_fields_lang_pkey PRIMARY KEY (field_id, lang_id, option_id);


--
-- Name: phpbb_profile_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_profile_fields
    ADD CONSTRAINT phpbb_profile_fields_pkey PRIMARY KEY (field_id);


--
-- Name: phpbb_profile_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_profile_lang
    ADD CONSTRAINT phpbb_profile_lang_pkey PRIMARY KEY (field_id, lang_id);


--
-- Name: phpbb_ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_ranks
    ADD CONSTRAINT phpbb_ranks_pkey PRIMARY KEY (rank_id);


--
-- Name: phpbb_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_reports
    ADD CONSTRAINT phpbb_reports_pkey PRIMARY KEY (report_id);


--
-- Name: phpbb_reports_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_reports_reasons
    ADD CONSTRAINT phpbb_reports_reasons_pkey PRIMARY KEY (reason_id);


--
-- Name: phpbb_search_results_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_search_results
    ADD CONSTRAINT phpbb_search_results_pkey PRIMARY KEY (search_key);


--
-- Name: phpbb_search_wordlist_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_search_wordlist
    ADD CONSTRAINT phpbb_search_wordlist_pkey PRIMARY KEY (word_id);


--
-- Name: phpbb_sessions_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_sessions_keys
    ADD CONSTRAINT phpbb_sessions_keys_pkey PRIMARY KEY (key_id, user_id);


--
-- Name: phpbb_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_sessions
    ADD CONSTRAINT phpbb_sessions_pkey PRIMARY KEY (session_id);


--
-- Name: phpbb_sitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_sitelist
    ADD CONSTRAINT phpbb_sitelist_pkey PRIMARY KEY (site_id);


--
-- Name: phpbb_smilies_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_smilies
    ADD CONSTRAINT phpbb_smilies_pkey PRIMARY KEY (smiley_id);


--
-- Name: phpbb_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_styles
    ADD CONSTRAINT phpbb_styles_pkey PRIMARY KEY (style_id);


--
-- Name: phpbb_teampage_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_teampage
    ADD CONSTRAINT phpbb_teampage_pkey PRIMARY KEY (teampage_id);


--
-- Name: phpbb_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_topics
    ADD CONSTRAINT phpbb_topics_pkey PRIMARY KEY (topic_id);


--
-- Name: phpbb_topics_posted_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_topics_posted
    ADD CONSTRAINT phpbb_topics_posted_pkey PRIMARY KEY (user_id, topic_id);


--
-- Name: phpbb_topics_track_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_topics_track
    ADD CONSTRAINT phpbb_topics_track_pkey PRIMARY KEY (user_id, topic_id);


--
-- Name: phpbb_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_users
    ADD CONSTRAINT phpbb_users_pkey PRIMARY KEY (user_id);


--
-- Name: phpbb_warnings_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_warnings
    ADD CONSTRAINT phpbb_warnings_pkey PRIMARY KEY (warning_id);


--
-- Name: phpbb_words_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_words
    ADD CONSTRAINT phpbb_words_pkey PRIMARY KEY (word_id);


--
-- Name: phpbb_zebra_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY phpbb_zebra
    ADD CONSTRAINT phpbb_zebra_pkey PRIMARY KEY (user_id, zebra_id);


--
-- Name: player_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: target_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY target
    ADD CONSTRAINT target_pkey PRIMARY KEY (id);


--
-- Name: war_pkey; Type: CONSTRAINT; Schema: public; Owner: gus; Tablespace: 
--

ALTER TABLE ONLY war
    ADD CONSTRAINT war_pkey PRIMARY KEY (id);


--
-- Name: idx_3af34668727aca70; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_3af34668727aca70 ON categories USING btree (parent_id);


--
-- Name: idx_3af3466879066886; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_3af3466879066886 ON categories USING btree (root_id);


--
-- Name: idx_466f2ffc5b81b612; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_466f2ffc5b81b612 ON target USING btree (war_id);


--
-- Name: idx_47c02d3b158e0b66; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_47c02d3b158e0b66 ON attack USING btree (target_id);


--
-- Name: idx_6c12ed317e36d865; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_6c12ed317e36d865 ON war USING btree (vs_clan_id);


--
-- Name: idx_6c12ed31ca2a1224; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_6c12ed31ca2a1224 ON war USING btree (bzh_clan_id);


--
-- Name: idx_98197a65beaf84c8; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX idx_98197a65beaf84c8 ON player USING btree (clan_id);


--
-- Name: phpbb_acl_groups_auth_opt_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_groups_auth_opt_id ON phpbb_acl_groups USING btree (auth_option_id);


--
-- Name: phpbb_acl_groups_auth_role_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_groups_auth_role_id ON phpbb_acl_groups USING btree (auth_role_id);


--
-- Name: phpbb_acl_groups_group_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_groups_group_id ON phpbb_acl_groups USING btree (group_id);


--
-- Name: phpbb_acl_options_auth_option; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_acl_options_auth_option ON phpbb_acl_options USING btree (auth_option);


--
-- Name: phpbb_acl_roles_data_ath_op_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_roles_data_ath_op_id ON phpbb_acl_roles_data USING btree (auth_option_id);


--
-- Name: phpbb_acl_roles_role_order; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_roles_role_order ON phpbb_acl_roles USING btree (role_order);


--
-- Name: phpbb_acl_roles_role_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_roles_role_type ON phpbb_acl_roles USING btree (role_type);


--
-- Name: phpbb_acl_users_auth_option_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_users_auth_option_id ON phpbb_acl_users USING btree (auth_option_id);


--
-- Name: phpbb_acl_users_auth_role_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_users_auth_role_id ON phpbb_acl_users USING btree (auth_role_id);


--
-- Name: phpbb_acl_users_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_acl_users_user_id ON phpbb_acl_users USING btree (user_id);


--
-- Name: phpbb_attachments_filetime; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_attachments_filetime ON phpbb_attachments USING btree (filetime);


--
-- Name: phpbb_attachments_is_orphan; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_attachments_is_orphan ON phpbb_attachments USING btree (is_orphan);


--
-- Name: phpbb_attachments_post_msg_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_attachments_post_msg_id ON phpbb_attachments USING btree (post_msg_id);


--
-- Name: phpbb_attachments_poster_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_attachments_poster_id ON phpbb_attachments USING btree (poster_id);


--
-- Name: phpbb_attachments_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_attachments_topic_id ON phpbb_attachments USING btree (topic_id);


--
-- Name: phpbb_banlist_ban_email; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_banlist_ban_email ON phpbb_banlist USING btree (ban_email, ban_exclude);


--
-- Name: phpbb_banlist_ban_end; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_banlist_ban_end ON phpbb_banlist USING btree (ban_end);


--
-- Name: phpbb_banlist_ban_ip; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_banlist_ban_ip ON phpbb_banlist USING btree (ban_ip, ban_exclude);


--
-- Name: phpbb_banlist_ban_user; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_banlist_ban_user ON phpbb_banlist USING btree (ban_userid, ban_exclude);


--
-- Name: phpbb_bbcodes_display_on_post; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_bbcodes_display_on_post ON phpbb_bbcodes USING btree (display_on_posting);


--
-- Name: phpbb_bots_bot_active; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_bots_bot_active ON phpbb_bots USING btree (bot_active);


--
-- Name: phpbb_config_is_dynamic; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_config_is_dynamic ON phpbb_config USING btree (is_dynamic);


--
-- Name: phpbb_confirm_confirm_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_confirm_confirm_type ON phpbb_confirm USING btree (confirm_type);


--
-- Name: phpbb_drafts_save_time; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_drafts_save_time ON phpbb_drafts USING btree (save_time);


--
-- Name: phpbb_ext_ext_name; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_ext_ext_name ON phpbb_ext USING btree (ext_name);


--
-- Name: phpbb_forums_forum_lastpost_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_forums_forum_lastpost_id ON phpbb_forums USING btree (forum_last_post_id);


--
-- Name: phpbb_forums_left_right_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_forums_left_right_id ON phpbb_forums USING btree (left_id, right_id);


--
-- Name: phpbb_forums_watch_forum_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_forums_watch_forum_id ON phpbb_forums_watch USING btree (forum_id);


--
-- Name: phpbb_forums_watch_notify_stat; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_forums_watch_notify_stat ON phpbb_forums_watch USING btree (notify_status);


--
-- Name: phpbb_forums_watch_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_forums_watch_user_id ON phpbb_forums_watch USING btree (user_id);


--
-- Name: phpbb_groups_group_legend_name; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_groups_group_legend_name ON phpbb_groups USING btree (group_legend, group_name);


--
-- Name: phpbb_icons_display_on_posting; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_icons_display_on_posting ON phpbb_icons USING btree (display_on_posting);


--
-- Name: phpbb_lang_lang_iso; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_lang_lang_iso ON phpbb_lang USING btree (lang_iso);


--
-- Name: phpbb_log_forum_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_log_forum_id ON phpbb_log USING btree (forum_id);


--
-- Name: phpbb_log_log_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_log_log_type ON phpbb_log USING btree (log_type);


--
-- Name: phpbb_log_reportee_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_log_reportee_id ON phpbb_log USING btree (reportee_id);


--
-- Name: phpbb_log_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_log_topic_id ON phpbb_log USING btree (topic_id);


--
-- Name: phpbb_log_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_log_user_id ON phpbb_log USING btree (user_id);


--
-- Name: phpbb_login_attempts_att_for; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_login_attempts_att_for ON phpbb_login_attempts USING btree (attempt_forwarded_for, attempt_time);


--
-- Name: phpbb_login_attempts_att_ip; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_login_attempts_att_ip ON phpbb_login_attempts USING btree (attempt_ip, attempt_time);


--
-- Name: phpbb_login_attempts_att_time; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_login_attempts_att_time ON phpbb_login_attempts USING btree (attempt_time);


--
-- Name: phpbb_login_attempts_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_login_attempts_user_id ON phpbb_login_attempts USING btree (user_id);


--
-- Name: phpbb_moderator_cache_disp_idx; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_moderator_cache_disp_idx ON phpbb_moderator_cache USING btree (display_on_index);


--
-- Name: phpbb_moderator_cache_forum_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_moderator_cache_forum_id ON phpbb_moderator_cache USING btree (forum_id);


--
-- Name: phpbb_modules_class_left_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_modules_class_left_id ON phpbb_modules USING btree (module_class, left_id);


--
-- Name: phpbb_modules_left_right_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_modules_left_right_id ON phpbb_modules USING btree (left_id, right_id);


--
-- Name: phpbb_modules_module_enabled; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_modules_module_enabled ON phpbb_modules USING btree (module_enabled);


--
-- Name: phpbb_notification_types_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_notification_types_type ON phpbb_notification_types USING btree (notification_type_name);


--
-- Name: phpbb_notifications_item_ident; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_notifications_item_ident ON phpbb_notifications USING btree (notification_type_id, item_id);


--
-- Name: phpbb_notifications_user; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_notifications_user ON phpbb_notifications USING btree (user_id, notification_read);


--
-- Name: phpbb_oauth_tokens_provider; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_oauth_tokens_provider ON phpbb_oauth_tokens USING btree (provider);


--
-- Name: phpbb_oauth_tokens_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_oauth_tokens_user_id ON phpbb_oauth_tokens USING btree (user_id);


--
-- Name: phpbb_poll_options_poll_opt_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_poll_options_poll_opt_id ON phpbb_poll_options USING btree (poll_option_id);


--
-- Name: phpbb_poll_options_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_poll_options_topic_id ON phpbb_poll_options USING btree (topic_id);


--
-- Name: phpbb_poll_votes_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_poll_votes_topic_id ON phpbb_poll_votes USING btree (topic_id);


--
-- Name: phpbb_poll_votes_vote_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_poll_votes_vote_user_id ON phpbb_poll_votes USING btree (vote_user_id);


--
-- Name: phpbb_poll_votes_vote_user_ip; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_poll_votes_vote_user_ip ON phpbb_poll_votes USING btree (vote_user_ip);


--
-- Name: phpbb_posts_forum_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_forum_id ON phpbb_posts USING btree (forum_id);


--
-- Name: phpbb_posts_post_username; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_post_username ON phpbb_posts USING btree (post_username);


--
-- Name: phpbb_posts_post_visibility; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_post_visibility ON phpbb_posts USING btree (post_visibility);


--
-- Name: phpbb_posts_poster_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_poster_id ON phpbb_posts USING btree (poster_id);


--
-- Name: phpbb_posts_poster_ip; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_poster_ip ON phpbb_posts USING btree (poster_ip);


--
-- Name: phpbb_posts_tid_post_time; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_tid_post_time ON phpbb_posts USING btree (topic_id, post_time);


--
-- Name: phpbb_posts_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_posts_topic_id ON phpbb_posts USING btree (topic_id);


--
-- Name: phpbb_privmsgs_author_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_author_id ON phpbb_privmsgs USING btree (author_id);


--
-- Name: phpbb_privmsgs_author_ip; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_author_ip ON phpbb_privmsgs USING btree (author_ip);


--
-- Name: phpbb_privmsgs_folder_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_folder_user_id ON phpbb_privmsgs_folder USING btree (user_id);


--
-- Name: phpbb_privmsgs_message_time; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_message_time ON phpbb_privmsgs USING btree (message_time);


--
-- Name: phpbb_privmsgs_root_level; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_root_level ON phpbb_privmsgs USING btree (root_level);


--
-- Name: phpbb_privmsgs_rules_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_rules_user_id ON phpbb_privmsgs_rules USING btree (user_id);


--
-- Name: phpbb_privmsgs_to_author_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_to_author_id ON phpbb_privmsgs_to USING btree (author_id);


--
-- Name: phpbb_privmsgs_to_msg_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_to_msg_id ON phpbb_privmsgs_to USING btree (msg_id);


--
-- Name: phpbb_privmsgs_to_usr_flder_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_privmsgs_to_usr_flder_id ON phpbb_privmsgs_to USING btree (user_id, folder_id);


--
-- Name: phpbb_profile_fields_fld_ordr; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_profile_fields_fld_ordr ON phpbb_profile_fields USING btree (field_order);


--
-- Name: phpbb_profile_fields_fld_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_profile_fields_fld_type ON phpbb_profile_fields USING btree (field_type);


--
-- Name: phpbb_reports_pm_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_reports_pm_id ON phpbb_reports USING btree (pm_id);


--
-- Name: phpbb_reports_post_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_reports_post_id ON phpbb_reports USING btree (post_id);


--
-- Name: phpbb_search_wordlist_wrd_cnt; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_search_wordlist_wrd_cnt ON phpbb_search_wordlist USING btree (word_count);


--
-- Name: phpbb_search_wordlist_wrd_txt; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_search_wordlist_wrd_txt ON phpbb_search_wordlist USING btree (word_text);


--
-- Name: phpbb_search_wordmatch_post_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_search_wordmatch_post_id ON phpbb_search_wordmatch USING btree (post_id);


--
-- Name: phpbb_search_wordmatch_un_mtch; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_search_wordmatch_un_mtch ON phpbb_search_wordmatch USING btree (word_id, post_id, title_match);


--
-- Name: phpbb_search_wordmatch_word_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_search_wordmatch_word_id ON phpbb_search_wordmatch USING btree (word_id);


--
-- Name: phpbb_sessions_keys_last_login; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_sessions_keys_last_login ON phpbb_sessions_keys USING btree (last_login);


--
-- Name: phpbb_sessions_session_fid; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_sessions_session_fid ON phpbb_sessions USING btree (session_forum_id);


--
-- Name: phpbb_sessions_session_time; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_sessions_session_time ON phpbb_sessions USING btree (session_time);


--
-- Name: phpbb_sessions_session_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_sessions_session_user_id ON phpbb_sessions USING btree (session_user_id);


--
-- Name: phpbb_smilies_display_on_post; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_smilies_display_on_post ON phpbb_smilies USING btree (display_on_posting);


--
-- Name: phpbb_styles_style_name; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_styles_style_name ON phpbb_styles USING btree (style_name);


--
-- Name: phpbb_topics_fid_time_moved; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_fid_time_moved ON phpbb_topics USING btree (forum_id, topic_last_post_time, topic_moved_id);


--
-- Name: phpbb_topics_forum_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_forum_id ON phpbb_topics USING btree (forum_id);


--
-- Name: phpbb_topics_forum_id_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_forum_id_type ON phpbb_topics USING btree (forum_id, topic_type);


--
-- Name: phpbb_topics_forum_vis_last; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_forum_vis_last ON phpbb_topics USING btree (forum_id, topic_visibility, topic_last_post_id);


--
-- Name: phpbb_topics_last_post_time; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_last_post_time ON phpbb_topics USING btree (topic_last_post_time);


--
-- Name: phpbb_topics_topic_visibility; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_topic_visibility ON phpbb_topics USING btree (topic_visibility);


--
-- Name: phpbb_topics_track_forum_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_track_forum_id ON phpbb_topics_track USING btree (forum_id);


--
-- Name: phpbb_topics_track_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_track_topic_id ON phpbb_topics_track USING btree (topic_id);


--
-- Name: phpbb_topics_watch_notify_stat; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_watch_notify_stat ON phpbb_topics_watch USING btree (notify_status);


--
-- Name: phpbb_topics_watch_topic_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_watch_topic_id ON phpbb_topics_watch USING btree (topic_id);


--
-- Name: phpbb_topics_watch_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_topics_watch_user_id ON phpbb_topics_watch USING btree (user_id);


--
-- Name: phpbb_user_group_group_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_user_group_group_id ON phpbb_user_group USING btree (group_id);


--
-- Name: phpbb_user_group_group_leader; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_user_group_group_leader ON phpbb_user_group USING btree (group_leader);


--
-- Name: phpbb_user_group_user_id; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_user_group_user_id ON phpbb_user_group USING btree (user_id);


--
-- Name: phpbb_users_user_birthday; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_users_user_birthday ON phpbb_users USING btree (user_birthday);


--
-- Name: phpbb_users_user_email_hash; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_users_user_email_hash ON phpbb_users USING btree (user_email_hash);


--
-- Name: phpbb_users_user_type; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE INDEX phpbb_users_user_type ON phpbb_users USING btree (user_type);


--
-- Name: phpbb_users_username_clean; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX phpbb_users_username_clean ON phpbb_users USING btree (username_clean);


--
-- Name: uniq_466f2ffc3da5256d; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX uniq_466f2ffc3da5256d ON target USING btree (image_id);


--
-- Name: uniq_6c12ed3177153098; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX uniq_6c12ed3177153098 ON war USING btree (code);


--
-- Name: uniq_98197a65389b783; Type: INDEX; Schema: public; Owner: gus; Tablespace: 
--

CREATE UNIQUE INDEX uniq_98197a65389b783 ON player USING btree (tag);


--
-- Name: fk_3af34668727aca70; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk_3af34668727aca70 FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE CASCADE;


--
-- Name: fk_3af3466879066886; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk_3af3466879066886 FOREIGN KEY (root_id) REFERENCES categories(id) ON DELETE CASCADE;


--
-- Name: fk_466f2ffc3da5256d; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY target
    ADD CONSTRAINT fk_466f2ffc3da5256d FOREIGN KEY (image_id) REFERENCES image(id);


--
-- Name: fk_466f2ffc5b81b612; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY target
    ADD CONSTRAINT fk_466f2ffc5b81b612 FOREIGN KEY (war_id) REFERENCES war(id);


--
-- Name: fk_47c02d3b158e0b66; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY attack
    ADD CONSTRAINT fk_47c02d3b158e0b66 FOREIGN KEY (target_id) REFERENCES target(id);


--
-- Name: fk_6c12ed317e36d865; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY war
    ADD CONSTRAINT fk_6c12ed317e36d865 FOREIGN KEY (vs_clan_id) REFERENCES clan(id);


--
-- Name: fk_6c12ed31ca2a1224; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY war
    ADD CONSTRAINT fk_6c12ed31ca2a1224 FOREIGN KEY (bzh_clan_id) REFERENCES clan(id);


--
-- Name: fk_98197a65beaf84c8; Type: FK CONSTRAINT; Schema: public; Owner: gus
--

ALTER TABLE ONLY player
    ADD CONSTRAINT fk_98197a65beaf84c8 FOREIGN KEY (clan_id) REFERENCES clan(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: gus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "gus";
GRANT ALL ON SCHEMA public TO "gus";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

