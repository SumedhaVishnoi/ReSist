<!-- *************************************************************************** -->
<!-- XSLT Document for SWIFT Measurement Report Viewing                          -->
<!--                                                                             -->
<!-- AUTHOR: Tero Pudas                                                          -->
<!--                                                                             -->
<!-- (c) 2004-2013 Nokia Solutions and Networks                                  -->
<!-- *************************************************************************** -->
<!-- VERSION HISTORY                                                             -->
<!-- V1.0.0    01-Jun-2004  T.Pudas       Released                               -->
<!-- V2.0.0    03-Feb-2012  T.Pudas       Updates for Swift 3                    -->
<!-- V2.0.1    20-Aug-2013  T.Pudas       NSN brand change                       -->
<!-- *************************************************************************** -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>SWIFT Measurement Report</TITLE>
        <STYLE TYPE="text/css">
          DIV {
          font-family: Arial;
          font-size: smaller;
          }
          DIV.title {
          font-size: 12pt;
          font-weight: bold;
          text-decoration: underline;
          }
          DIV.bold {
          font-weight: bold;
          }
          DIV.meas {
          font-family: "Courier New";
          font-size: 9pt;
          }
          DIV.error {
          font-weight: bold;
          color: #FF0000;
          }
          TH {
          background-color: RGB(200,200,200);
          }
          TD.pass {
          background-color: RGB(0,255,0);
          }
          TD.fail {
          background-color: RGB(255,0,0);
          }
          TD.bogus {
          background-color: RGB(255,130,130);
          }
          TD.abort {
          background-color: RGB(170,0,0);
          }
          TD.error {
          background-color: RGB(160,160,160);
          }
        </STYLE>
      </HEAD>
      <BODY BGCOLOR="white">
        <DIV CLASS="title">
          <xsl:text>Measurement Report for SFC </xsl:text>
          <xsl:value-of select="//HEADER/DUT/SERIAL_NUMBER" />
        </DIV>
        <BR />

        <!-- ** ERROR MESSAGE (if exists) ** -->
        <xsl:if test="//RESULT_DATA/ERROR_MSG">
          <DIV CLASS="error">
            <xsl:text>VMfg TRANSFER FAILED - </xsl:text>
            <xsl:value-of select="//RESULT_DATA/ERROR_MSG" />
          </DIV>
          <BR />
        </xsl:if>

        <!-- ** HEADER ** -->
        <TABLE WIDTH="800" BORDER="0">
          <TR>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Test Plan ID:</DIV>
            </TD>
            <TD WIDTH="30%">
              <DIV>
                <xsl:value-of select="//HEADER/TEST_SPEC_ID" />
              </DIV>
            </TD>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Site:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/SITE" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">Serial Number:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/DUT/SERIAL_NUMBER" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Operation:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/OPERATION" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">Product Code (Item):</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/DUT/PRODUCT_CODE" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Resource:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/SERIAL_NUMBER" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">Shop Order:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/DUT/SHOP_ORDER" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Name:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/NAME" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">DUT SW Version:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/DUT/SW_VERSION" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">SWIFT Version:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER//SWIFT_VERSION" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">DUT Position:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/DUT/POSITION" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Tester SW Version:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/SW_VERSION" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">Cabinet Serial Number:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/CABINET/SERIAL_NUMBER" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Tester HW Version:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/HW_VERSION" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold">Cabinet Product Code:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/CABINET/PRODUCT_CODE" />
              </DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Test Sequence:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/TEST_SEQUENCE" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD>
              <DIV CLASS="bold"></DIV>
            </TD>
            <TD>
              <DIV></DIV>
            </TD>
            <TD>
              <DIV CLASS="bold">Sequence Version:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//HEADER/TESTER/SEQUENCE_VERSION" />
              </DIV>
            </TD>
          </TR>
        </TABLE>
        <BR />
        <TABLE WIDTH="800" BORDER="0">
          <TR>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Test Start Time:</DIV>
            </TD>
            <TD WIDTH="30%" COLSPAN="2">
              <DIV>
                <xsl:value-of select="//RESULT_DATA/TEST_START" />
              </DIV>
            </TD>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Setup Time:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//RESULT_DATA/TIMES/SETUP_TIME" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Test Stop Time:</DIV>
            </TD>
            <TD WIDTH="30%" COLSPAN="2">
              <DIV>
                <xsl:value-of select="//RESULT_DATA/TEST_STOP" />
              </DIV>
            </TD>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Unload Time:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//RESULT_DATA/TIMES/UNLOAD_TIME" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Diagnostics:</DIV>
            </TD>
            <TD WIDTH="30%" COLSPAN="2">
              <DIV>
                <xsl:value-of select="//RESULT_DATA/DIAGNOSTICS" />
              </DIV>
            </TD>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Total Test Time:</DIV>
            </TD>
            <TD>
              <DIV>
                <xsl:value-of select="//RESULT_DATA/TIMES/TEST_TIME" />
              </DIV>
            </TD>
          </TR>
          <TR>
            <TD WIDTH="20%">
              <DIV CLASS="bold">Overall Status:</DIV>
            </TD>
            <xsl:choose>
              <xsl:when test="//RESULT_DATA/OVERALL_STATUS = 'P' or //RESULT_DATA/OVERALL_STATUS = 'PASS'">
                <TD CLASS="pass" WIDTH="13%" ALIGN="center">
                  <DIV CLASS="bold">
                    <xsl:call-template name="GetStatus">
                      <xsl:with-param name="status">
                        <xsl:value-of select="//RESULT_DATA/OVERALL_STATUS" />
                      </xsl:with-param>
                    </xsl:call-template>
                  </DIV>
                </TD>
                <TD />
              </xsl:when>
              <xsl:when test="//RESULT_DATA/OVERALL_STATUS = 'F' or //RESULT_DATA/OVERALL_STATUS = 'FAIL'">
                <TD CLASS="fail" WIDTH="13%" ALIGN="center">
                  <DIV CLASS="bold">
                    <xsl:call-template name="GetStatus">
                      <xsl:with-param name="status">
                        <xsl:value-of select="//RESULT_DATA/OVERALL_STATUS" />
                      </xsl:with-param>
                    </xsl:call-template>
                  </DIV>
                </TD>
                <TD />
              </xsl:when>
              <xsl:when test="//RESULT_DATA/OVERALL_STATUS = 'A' or //RESULT_DATA/OVERALL_STATUS = 'ABORT'">
                <TD CLASS="abort" WIDTH="13%" ALIGN="center">
                  <DIV CLASS="bold">
                    <xsl:call-template name="GetStatus">
                      <xsl:with-param name="status">
                        <xsl:value-of select="//RESULT_DATA/OVERALL_STATUS" />
                      </xsl:with-param>
                    </xsl:call-template>
                  </DIV>
                </TD>
                <TD />
              </xsl:when>
              <xsl:when test="//RESULT_DATA/OVERALL_STATUS = 'B' or //RESULT_DATA/OVERALL_STATUS = 'BOGUS'">
                <TD CLASS="bogus" WIDTH="13%" ALIGN="center">
                  <DIV CLASS="bold">
                    <xsl:call-template name="GetStatus">
                      <xsl:with-param name="status">
                        <xsl:value-of select="//RESULT_DATA/OVERALL_STATUS" />
                      </xsl:with-param>
                    </xsl:call-template>
                  </DIV>
                </TD>
                <TD />
              </xsl:when>
              <xsl:otherwise>
                <TD CLASS="error" WIDTH="13%" ALIGN="center">
                  <DIV CLASS="bold">
                    <xsl:call-template name="GetStatus">
                      <xsl:with-param name="status">
                        <xsl:value-of select="//RESULT_DATA/OVERALL_STATUS" />
                      </xsl:with-param>
                    </xsl:call-template>
                  </DIV>
                </TD>
                <TD />
              </xsl:otherwise>
            </xsl:choose>
          </TR>
        </TABLE>
        <BR />

        <!-- ** MEASUREMENTS ** -->
        <DIV CLASS="title">Measurements</DIV>
        <BR />
        <TABLE WIDTH="850" BORDER="0">
          <TR ALIGN="left">
            <TH WIDTH="7%" ALIGN="center">
              <DIV CLASS="bold">Meas ID</DIV>
            </TH>
            <TH WIDTH="28%">
              <DIV CLASS="bold">Meas Name</DIV>
            </TH>
            <TH WIDTH="5%" ALIGN="center">
              <DIV CLASS="bold">Slot</DIV>
            </TH>
            <TH WIDTH="8%" ALIGN="center">
              <DIV CLASS="bold">Channel</DIV>
            </TH>
            <TH WIDTH="9%" ALIGN="center">
              <DIV CLASS="bold">Acc Low</DIV>
            </TH>
            <TH WIDTH="9%" ALIGN="center">
              <DIV CLASS="bold">Acc High</DIV>
            </TH>
            <TH WIDTH="9%" ALIGN="center">
              <DIV CLASS="bold">Result</DIV>
            </TH>
            <TH WIDTH="7%" ALIGN="center">
              <DIV CLASS="bold">UoM</DIV>
            </TH>
            <TH WIDTH="7%" ALIGN="center">
              <DIV CLASS="bold">Status</DIV>
            </TH>
            <TH WIDTH="4%" ALIGN="center">
              <DIV CLASS="bold">Tol</DIV>
            </TH>
            <TH ALIGN="center">
              <DIV CLASS="bold">Time</DIV>
            </TH>
          </TR>
          <xsl:for-each select="//MEASUREMENT">
            <xsl:if test="STEP_TYPE = 'NI_MultipleNumericLimitTest'">
            </xsl:if>
            <TR>
              <TD ALIGN="center">
                <DIV CLASS="meas">
                  <xsl:value-of select="ID" />
                </DIV>
              </TD>
              <TD>
                <xsl:choose>
                  <xsl:when test="STEP_TYPE = 'NI_MultipleNumericLimitTest'">
                    <DIV CLASS="meas">
                      <xsl:text></xsl:text>
                      <xsl:value-of select="NAME" />
                    </DIV>
                  </xsl:when>
                  <xsl:otherwise>
                    <DIV CLASS="meas">
                      <xsl:value-of select="NAME" />
                    </DIV>
                  </xsl:otherwise>
                </xsl:choose>
              </TD>
              <TD ALIGN="center">
                <xsl:choose>
                  <xsl:when test="ID/@SLOT != ''">
                    <DIV CLASS="meas">
                      <xsl:value-of select="ID/@SLOT" />
                    </DIV>
                  </xsl:when>
                  <xsl:otherwise>
                    <DIV CLASS="meas">0</DIV>
                  </xsl:otherwise>
                </xsl:choose>
              </TD>
              <TD ALIGN="center">
                <xsl:choose>
                  <xsl:when test="TEST_CHANNEL != ''">
                    <DIV CLASS="meas">
                      <xsl:value-of select="TEST_CHANNEL" />
                    </DIV>
                  </xsl:when>
                  <xsl:otherwise>
                    <DIV CLASS="meas">N/A</DIV>
                  </xsl:otherwise>
                </xsl:choose>
              </TD>
              <TD ALIGN="center">
                <DIV CLASS="meas">
                  <xsl:value-of select="ACC_LOW" />
                </DIV>
              </TD>
              <TD ALIGN="center">
                <DIV CLASS="meas">
                  <xsl:value-of select="ACC_HIGH" />
                </DIV>
              </TD>
              <TD ALIGN="center">
                <DIV CLASS="meas">
                  <xsl:value-of select="RESULT" />
                </DIV>
              </TD>
              <TD ALIGN="center">
                <DIV CLASS="meas">
                  <xsl:value-of select="UNIT_OF_MEAS" />
                </DIV>
              </TD>
              <xsl:choose>
                <xsl:when test="STATUS = 'P' or STATUS = 'PASS'">
                  <TD CLASS="pass" ALIGN="center">
                    <DIV CLASS="meas">
                      <xsl:call-template name="GetStatus">
                        <xsl:with-param name="status">
                          <xsl:value-of select="STATUS" />
                        </xsl:with-param>
                      </xsl:call-template>
                    </DIV>
                  </TD>
                </xsl:when>
                <xsl:when test="STATUS = 'F' or STATUS = 'FAIL'">
                  <TD CLASS="fail" ALIGN="center">
                    <DIV CLASS="meas">
                      <xsl:call-template name="GetStatus">
                        <xsl:with-param name="status">
                          <xsl:value-of select="STATUS" />
                        </xsl:with-param>
                      </xsl:call-template>
                    </DIV>
                  </TD>
                </xsl:when>
                <xsl:when test="STATUS = 'A' or STATUS = 'ABORT'">
                  <TD CLASS="abort" ALIGN="center">
                    <DIV CLASS="meas">
                      <xsl:call-template name="GetStatus">
                        <xsl:with-param name="status">
                          <xsl:value-of select="STATUS" />
                        </xsl:with-param>
                      </xsl:call-template>
                    </DIV>
                  </TD>
                </xsl:when>
                <xsl:when test="STATUS = 'B' or STATUS = 'BOGUS'">
                  <TD CLASS="bogus" ALIGN="center">
                    <DIV CLASS="meas">
                      <xsl:call-template name="GetStatus">
                        <xsl:with-param name="status">
                          <xsl:value-of select="STATUS" />
                        </xsl:with-param>
                      </xsl:call-template>
                    </DIV>
                  </TD>
                </xsl:when>
                <xsl:otherwise>
                  <TD CLASS="error" ALIGN="center">
                    <DIV CLASS="meas">
                      <xsl:call-template name="GetStatus">
                        <xsl:with-param name="status">
                          <xsl:value-of select="STATUS" />
                        </xsl:with-param>
                      </xsl:call-template>
                    </DIV>
                  </TD>
                </xsl:otherwise>
              </xsl:choose>
              <TD ALIGN="center">
                <xsl:choose>
                  <xsl:when test="TOL_LIMIT_FLAG != '0'">
                    <DIV CLASS="meas">Y</DIV>
                  </xsl:when>
                  <xsl:otherwise>
                    <DIV CLASS="meas">N</DIV>
                  </xsl:otherwise>
                </xsl:choose>
              </TD>
              <TD ALIGN="center">
                <DIV CLASS="meas">
                  <xsl:value-of select="TEST_TIME" />
                </DIV>
              </TD>
            </TR>
          </xsl:for-each>
        </TABLE>
      </BODY>
    </HTML>
  </xsl:template>

  <!-- ** TEMPLATE: GetStatus ** -->
  <xsl:template name="GetStatus">
    <xsl:param name="status" />
    <xsl:choose>
      <xsl:when test="$status = 'P'">PASS</xsl:when>
      <xsl:when test="$status = 'F'">FAIL</xsl:when>
      <xsl:when test="$status = 'B'">BOGUS</xsl:when>
      <xsl:when test="$status = 'A'">ABORT</xsl:when>
      <xsl:when test="$status = 'S'">Skipped</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$status" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>