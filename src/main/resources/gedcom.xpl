<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step
    version="1.0"
    xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
    <p:option name="filename"/>

    <p:input port="source" sequence="true"/>
    <p:output port="result"/>

    <p:xslt name="lines-to-xml">
        <p:input port="stylesheet">
            <p:document href="xslt/toxml.xslt"/>
        </p:input>
        <p:with-option name="template-name" select="'xsl:initial-template'"/>
        <p:with-param name="filename" select="$filename"/>
    </p:xslt>

    <p:xslt name="find-level-numbers">
        <p:input port="stylesheet">
            <p:document href="xslt/level.xslt"/>
        </p:input>
        <p:input port="parameters"/>
    </p:xslt>

    <p:xslt name="fix-missing-level-numbers">
        <p:input port="stylesheet">
            <p:document href="xslt/fixlev.xslt"/>
        </p:input>
        <p:input port="parameters"/>
    </p:xslt>

    <p:xslt name="generate-hierarchy">
        <p:input port="stylesheet">
            <p:document href="xslt/hier.xslt"/>
        </p:input>
        <p:input port="parameters"/>
    </p:xslt>

    <p:xslt name="parse-gedcom-lines">
        <p:input port="stylesheet">
            <p:document href="xslt/parse_raw_nodes.xslt"/>
        </p:input>
        <p:input port="parameters"/>
    </p:xslt>

    <!-- TODO: verify_valid_ids.xslt -->
<!--

    <p:xslt name="generate-id-map-or-remap">
        <p:input port="stylesheet">
            <p:document href="xslt/generate_id_map.xslt"/>
        </p:input>
        <p:with-param name="remap" select="'false'"/>
    </p:xslt>
    <p:xslt name="generate-id-map-or-remap">
        <p:input port="stylesheet">
            <p:document href="xslt/remap_ids.xslt"/>
        </p:input>
        <p:with-param name="idfile" select="???TODO???"/>
    </p:xslt>
 -->

    <p:xslt name="process-cont-conc-lines">
        <p:input port="stylesheet">
            <p:document href="xslt/contconc.xslt"/>
        </p:input>
        <p:input port="parameters"/>
    </p:xslt>
</p:declare-step>