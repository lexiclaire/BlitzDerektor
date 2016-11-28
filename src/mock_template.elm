module Mock_template exposing (..)

import Html exposing (..)

import Derektor.Data as Data

mockTemplate : String
mockTemplate = 
    """
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>
      </head>
      <body dir="ltr">
        <div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;background-color:#FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
        <p><br></p>
        <br>
        <br>
        <div style="color: rgb(0, 0, 0);">
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt">
        <b>From:</b> appreciate@appreciatehub.com &lt;appreciate@appreciatehub.com&gt;<br>
        <b>Sent:</b> Tuesday, August 2, 2016 9:55 AM<br>
        <b>To:</b> |recipientEmail|<br>
        <b>Subject:</b> |senderFullNameEprod| sent you an |eCardLabel|!</font>
        <div>&nbsp;</div>
        </div>
        <div>
        <table width="610" border="0" align="center" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(80, 80, 80);">
          <tbody>
            <tr>
            <td width="610" valign="top"><img style="-webkit-user-select: none;" src="https://oct.assets.appreciatehub.com/webresources/documentum/PublishClientImage/0001795789/images/trowe-logo.jpg?e1471017352&amp;h2b3abdf493f6f7cf9acbb0fc5f427c7e">
            <img style="-webkit-user-select: none;" src="https://oct.assets.appreciatehub.com/webresources/documentum/templates/emailTemplates/sticky/images/hr.jpg?e1471017352&amp;he91665fde158f739bce1266d89a1ec6f">
            <table width="610" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(80, 80, 80);">
              <tbody>
                <tr>
                <td width="410" align="left" valign="top" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(157, 157, 157);">
                <br>
                |senderFullNameEprod| sent you an eCard! </td>
                <td width="200" align="right" valign="top"></td>
                </tr>
              </tbody>
            </table>
            </td>
            </tr>
            <tr>
            <td height="270px" valign="middle" align="center"><img style="-webkit-user-select: none;" src="https://oct.assets.appreciatehub.com/webresources/documentum/templates/emailTemplates/sticky/images/en_US/goodnews_note.jpg?e1471017352&amp;hd4926219fe152a25ce2d2cef025ac418">
            </td>
            </tr>
            <tr>
            <td valign="top" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(80, 80, 80);">
            <p><br>
            </p>
            <p>Dear |recipientFullNameEprod|,<br>
            <br>
            |senderFullNameEprod| sent you an |eCardLabel|. To view it, click <a href="https://www.appreciatehub.com/receiveECard.seam?eIdRHZa8mL%2BGVKE9QDcfaA7%2BA%%" style="color: rgb(157, 157, 157);">here</a>, or copy and paste the following link into your Web browser address window:<br>
            <br>
            |ecardLinkURL|<br>
            <br>
            Thank You.<br>
            </p>
            <p></p>
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(157, 157, 157);">
            This is an automatically generated email, please do not reply. </p>
            </td>
            </tr>
          </tbody>
        </table>
    </div>
    </div>
    </div>
    </body>
    </html>
    """