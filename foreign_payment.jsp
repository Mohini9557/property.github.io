<%@include file="header.jsp"%>
<%@ page import="java.util.Hashtable,javax.naming.ldap.*,javax.naming.directory.*,javax.naming.*,java.util.Calendar,java.sql.Date.*,java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload,org.apache.commons.fileupload.FileItem, org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<!DOCTYPE html>
<html>
<head>
	<title>WORK PERMIT</title>
  <script type="text/javascript" src = "js/jquery-ui.js"></script>
<script src="js/jquery.validate.js"></script>
	<style type="text/css">
		    .card {
      box-shadow: 2px 4px 8px 2px rgba(0,0,0,0.2);
        transition: 0.3s;
            margin-top: 20px;
       
    }
    form#form {
    margin-top: 20px;
}

input.style-right-button {
 margin-left: 45%;
    

}
.card-header:first-child {
   margin-top: 0px !important ;
}


	</style>
</head>
<script>

$(function(){

    $( "#approval_date" ).datepicker
    ({
    
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    dateFormat: 'dd-M-y',
    
     });
    
  
   });


   function Validate() {
	     // var sr_no = document.getElementById("sr_no");
        var username = document.getElementById("username");
        var user_emp_no = document.getElementById("user_emp_no");
        var vendor_no = document.getElementById("vendor_no");
        var vendor_name = document.getElementById("vendor_name");
        var nature_payment = document.getElementById("nature_payment");
        var amount = document.getElementById("amount");
        var currency = document.getElementById("currency");
        var approval_ref = document.getElementById("approval_ref");
        var approval_date = document.getElementById("approval_date");
        var invoice = document.getElementById("invoice_file");
        var filenote = document.getElementById("filenote_file");
        var form10 = document.getElementById("form10_file");
        var pe_decleration = document.getElementById("pe_decleration_file");
        var trc = document.getElementById("trc_file");
    
   
        if (username.value == "") {
          
            alert("Please enter username");
            return false;
        }
        else if (user_emp_no.value == "") {
          
            alert("Please Enter Employee no");
            return false;
        }
        else if (vendor_no.value == "") {
          
            alert("Please Enter vendor_no");
            return false;
        }
        else if (vendor_name.value == "") {
          
            alert("Please Enter vendor_name");
            return false;
        }
        else if (nature_payment .value == "") {
          
            alert("Please Enter nature payment");
            return false;
        }
        else if (amount.value == "") {
          
            alert("Please Enter amount");
            return false;
        }
     
        else if (currency.value == "") {
          
            alert("Please Enter currency");
            return false;
        }
        else if (approval_ref.value == "") {
          
            alert("Please Enter Approval Reference");
            return false;
        }
            else if (approval_date.value == "") {
          
            alert("Please Enter Approval Date");
            return false;
        }
        else if (invoice.value == "") {
          
            alert("Please  Attach Invoice file");
            return false;
        }
        else if (filenote.value == "") {
          
            alert("Please Attach FileNote file");
            return false;
        }
     
       else if (form10.value == "") {
          
            alert("Please Attach form10 file");
            return false;
        }
        else if (pe_decleration.value == "") {
          
            alert("Please Attach PE Decleration file");
            return false;
        }
            else if (trc.value == "") {
          
            alert("Please Attach TRC file");
            return false;
        }
     
      else {
			//alert("2");
			document.form1.action_type.value = "submit";
	   document.form1.submit();
    return true;
        }   
    }
   </script>

<%
//String login="31919150";
String query = "";
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
String action_type="",title="",ttitle="";
String sr_no="",username="",user_emp_no="",vendor_no="",vendor_name="",nature_payment="",amount="",approval_date="",currency="",invoice_file="",approval_ref="",filenote_file="",form10_file="",pe_decleration_file="",trc_file="",login="";

login= (String)session.getAttribute("emp_no");

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  if (isMultipart) {
    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
    List fileItemsList = servletFileUpload.parseRequest(request);
    Iterator it = fileItemsList.iterator();
    File tempDir = null;
    String attnames = "" ;
    while (it.hasNext()) {
      FileItem fileItem = (FileItem) it.next();
      String name = fileItem.getFieldName();
      String value = fileItem.getString();
      if (value.equals("null"))
        value = "";
      if (fileItem.isFormField()) {

      if (name.equals("action_type")) {
          action_type = value;
		   out.println(action_type);
          //saveBtn = "Save";
        }
      
      else if(name.equals("username")){
          username=value;
        //  out.println(username);
      }
      else if(name.equals("user_emp_no")){
          user_emp_no=value;
        //  out.println(user_emp_no);
      }
      else if(name.equals("vendor_no"))
      {
          vendor_no=value;
         // out.println(vendor_no);
      }
      else if(name.equals("vendor_name"))
      {
          vendor_name=value;
      //    out.println(vendor_name);
      }
      else if(name.equals("nature_payment"))
      {
          nature_payment=value;
       //   out.println(nature_payment);
      }
      else if(name.equals("amount"))
      {
          amount=value;
         // out.println(amount);
      }
      else if(name.equals("approval_date"))
      {
          approval_date=value;
        //  out.println(approval_date);
      }
      else if(name.equals("currency"))
      {
          currency=value;
         // out.println(currency);
      }
      else if(name.equals("invoice_file"))
      {
          invoice_file=value;
        //  out.println(invoice_file);
      } 
      else if(name.equals("approval_ref"))
      {
          approval_ref=value;
         // out.println(approval_ref);
      }
      else if(name.equals("filenote_file"))
      {
          filenote_file=value;
        //  out.println(filenote_file);
      }
      else if(name.equals("form10_file"))
      {
          form10_file=value;
         // out.println(form10_file);
      }
      else if(name.equals("pe_decleration_file"))
      {
          pe_decleration_file=value;
        //  out.println(pe_decleration_file);
      }
      else if(name.equals("trc_file"))
      {
          trc_file=value;
        //  out.println(trc_file);
      } 

      }

      else{
      value = fileItem.getName();
      int ind=0;
      String attError="",filePath="",a="";
      boolean checkattach=name.contains("file");
      if(checkattach) { //if attach
        if(!"".equals(value)) {
          long fileSize = fileItem.getSize();
          if(fileSize > 0) {                           
            int dotPos= value.lastIndexOf(".");
            if(dotPos == -1) {
              attError = "Please select the attachment file format to upload with extension";
              out.println("<br><br><br><h4 align=center><font color=red>"+attError+"</h4>");
              return;
            } else {
              String extension = value.substring(dotPos+1);                
              if(!(extension.equalsIgnoreCase("jpg") )||extension.equalsIgnoreCase("jpeg") || extension.equalsIgnoreCase("pdf") || extension.equalsIgnoreCase("png")){
                attError = "Please  select the attachment in pdf format to upload";
                out.println("<br><br><br><h4 align=center><font color=red>"+attError+"</h4>");
                return;
              } else {
                ServletContext sc = session.getServletContext();
                filePath = storepath+"Attachments";
                tempDir = new File(filePath);
                if(tempDir.exists() == false){
                tempDir.mkdir();
                }
                DateFormat df = new SimpleDateFormat("yyyyMMddhhmmSSS");
                Date today = Calendar.getInstance().getTime();
                String reportDate = df.format(today);
                File fileToCreate = null;
                
                if(name.equals("invoice_file")){
                  title = login+"_invoice_file"+reportDate+"."+extension;
                  invoice_file = title;
                  fileToCreate = new File(filePath, invoice_file); 

                }
				       if(name.equals("filenote_file")){
                  title = login+"_filenote_file"+reportDate+"."+extension;
                  filenote_file = title;
                  fileToCreate = new File(filePath, filenote_file);  
                }
				       if(name.equals("form10_file")){
                  title = login+"_form10_file"+reportDate+"."+extension;
                  form10_file = title;
                  fileToCreate = new File(filePath, form10_file);  
                }
                   if(name.equals("pe_decleration_file")){
                  title = login+"_pe_decleration_file"+reportDate+"."+extension;
                  pe_decleration_file = title;
                  fileToCreate = new File(filePath, pe_decleration_file);  
                }
                   if(name.equals("trc_file")){
                  title = login+"_trc_file"+reportDate+"."+extension;
                  trc_file = title;
                  fileToCreate = new File(filePath, trc_file);  
                }
             
                
                try {
                  if(fileToCreate.exists() == false){
                    fileItem.write(fileToCreate);
                    ttitle = title.toString();
                    if(name.equals("invoice_file")){
                      ttitle = invoice_file.toString();
                      invoice_file=ttitle;
                     // out.print(invoice_file);
                      if(invoice_file == null){
                        invoice_file = "";
                      }

                    }
                      if(name.equals("filenote_file")){
                      ttitle = filenote_file.toString();
                      filenote_file=ttitle;
                      if(filenote_file == null){
                        filenote_file = "";
                      }
                    }
                       if(name.equals("form10_file")){
                      ttitle = form10_file.toString();
                      form10_file=ttitle;
                      if(form10_file == null){
                        form10_file = "";
                      }
                    }
                     if(name.equals("pe_decleration_file")){
                      ttitle = pe_decleration_file.toString();
                      pe_decleration_file=ttitle;
                      if(pe_decleration_file == null){
                        pe_decleration_file = "";
                      }
                    }
                      if(name.equals("trc_file")){
                      ttitle = trc_file.toString();
                      trc_file=ttitle;
                      if(trc_file == null){
                        trc_file = "";
                      }
                    }   
                  } 

                  else{
                    //out.println("File Already Exist!!");
                  }
                }
                 catch (Exception e){
                  attError = "ERROR IN ATTACHMENT UPLOAD";
                  e.getMessage();
                  out.println("<br><br><br><h4 align=center><font color=red>"+e+"</h4>");
                  return;
                }


              }
            }
          }
                  
        }
      }
      }
    }
  }
    
try{
String  emp_no1 = (String)session.getAttribute("emp_no");
String empName1 =nullValue((String)session.getAttribute("empName"));
if(action_type.equals("submit"))
{

   ps=conMysql.prepareStatement("insert into foreign_payment(username,user_empno,vendor_no,vendor_name,nature_payment,amount ,approval_date,currency,approval_referance,invoice_file,filenote_file,form10f_file,PE_decleration_file,TRC_file,update_by,update_name,update_date) values (?,?,?,?,?,?,STR_TO_DATE(?,'%d-%M-%Y'),?,?,?,?,?,?,?,?,?,sysdate())");

   
    ps.setString(1,username);
    ps.setString(2,user_emp_no);
    ps.setString(3,vendor_no);
    ps.setString(4,vendor_name);
    ps.setString(5,nature_payment);
    ps.setString(6,amount);
    ps.setString(7,approval_date);
    ps.setString(8,currency);
    ps.setString(9,approval_ref);
    ps.setString(10,invoice_file);
    ps.setString(11,filenote_file);
    ps.setString(12,form10_file);
    ps.setString(13,pe_decleration_file);
    ps.setString(14,trc_file);
    ps.setString(15,emp_no1);
    ps.setString(16,empName1);
    count = ps.executeUpdate();


    if(count>0)
    {
         %>
          <script>
             alert("Data Inserted");
             window.location.href="foreign_payment.jsp";
         </script>         
         <% 
     
     }
   }

 }

 catch(Exception e)
 {
  out.print(e);
 }
				
%>




<body>

	<div class="container divheight " >
	<div class="card" style="height:510px;">
		<h5 class="card-header  style-text-white  py-4 style-app-name">Application Form For Requesting Foreign Payment</h5>
		<form class="card-body px-lg-5 pt-0" name="form1" id="form1" method="POST" enctype="multipart/form-data" action="foreign_payment.jsp" onsubmit="return Validate()">
      <input type="hidden" name="action_type" id="action_type">
      <div class="row">
        <div class="col-sm-4 form-group">
          <label><b>SR.No</b></label>
          <input type="text" class="form-control" disabled="" placeholder="Enter Serial Number" name="sr_no"  id="sr_no">
        </div>
        <div class="col-sm-4 form-group">
          <label><b>Username</b></label>
          <input type="text" class="form-control"  placeholder="Enter Username" name="username" id="username">
        </div>
        <div class="col-sm-4 form-group">
          <label><b>User Emp_No</b></label>
          <input type="text" class="form-control"  placeholder="Enter User Employee Number" name="user_emp_no" id="user_emp_no">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4 form-group">
          <label><b>Vendor No If Any</b></label>
          <input type="text" class="form-control"  placeholder="Enter Vendor Number" name="vendor_no" id="vendor_no">
        </div>
        <div class="col-sm-4 form-group">
          <label><b>Vendor Name</b></label>
          <input type="text" class="form-control"  placeholder="Enter Vendor Name" name="vendor_name" id="vendor_name">
        </div>
        <div class="col-sm-4 form-group">
          <label><b>Nature Of Payment</b></label>
          <input type="text" class="form-control"  placeholder="Enter Nature Of Payment" name="nature_payment" id="nature_payment">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4 form-group">
          <label><b>Amount</b></label>
          <input type="text" class="form-control"  placeholder="Enter Amount" name="amount" id="amount">
        </div>
        <div class="col-sm-4 form-group">
          <label><b>Currency</b></label>
          <input type="text" class="form-control"  placeholder="Enter Currency" name="currency" id="currency">
        </div>
        <div class="col-sm-4 form-group">
          <label><b>Approval Reference</b></label>
          <input type="text" class="form-control"  placeholder="Enter Approval Reference" name="approval_ref" id="approval_ref">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4 form-group">
          <label><b>Approval Date</b></label>
          <input type="text" class="form-control gantt-block-label" name="approval_date" id="approval_date" placeholder="Enter Approval Date">
        </div>
        <div class="col-sm-4 form-group">
           <label><b>Invoice</b></label>
             <input type="file" placeholder="Attach file" class="form-control" name="invoice_file" id="invoice_file" >
        </div>
        <div class="col-sm-4 form-group">
           <label><b>FileNote</b></label>
             <input type="file" placeholder="Attach file" class="form-control" name="filenote_file" id="filenote_file" >
        </div>
      </div>
      <div class="row">
         <div class="col-sm-4 form-group">
           <label><b>Form 10F</b></label>
             <input type="file" placeholder="Attach file" class="form-control" name="form10_file" id="form10_file" >
         </div>
         <div class="col-sm-4 form-group">
           <label><b>PE Decleration</b></label>
             <input type="file" placeholder="Attach file" class="form-control" name="pe_decleration_file" id="pe_decleration_file" >
         </div>
         <div class="col-sm-4 form-group">
           <label><b>TRC</b></label>
             <input type="file" placeholder="Attach file" class="form-control" name="trc_file"  id="trc_file">
         </div>
     </div>
     <input type="submit" value="Submit" name="submit1" id="submit1" class="style-right-button">
	</form>
</div>
</div>
</body>
</html>
<br>
<%@include file="footer.jsp"%>