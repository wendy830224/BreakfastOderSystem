<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="style1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<img src="img/LOGO.jpg"  width="auto" height="100" >   

<span style="font-family:DFKai-sb;font-size: 60px">�H�˩���</span>
<span style="font-family:DFKai-sb;font-size: 20px";>��@�����\</span>




<table class="mytable col-sm-10" cellpadding="10" border='1'>
    <thead>
     
        <tr>
            <th>�Ŀ�</th>
            <th>����</th>
            <th>����</th>
            <th>�M��</th>
            <th>�Ӥ�</th> 
        </tr>
    </thead>
    
    <tbody>    
        <tr>
            <td><input type="checkbox" id="myCheck1" onclick="myFunction1()"></td><td>���</td>
            <td>$10</td>
            <td> <select id="drink1" onchange="drinkfunction1(this);">    <!--���s�Oonclick  ���Oonchange-->
                    <option selected="selected" value1="0">�аݻݭn�X�M</option>
                    <option value="10">1</option>
                    <option value="20">2</option>
                    <option value="30">3</option>
                    <option value="40">4</option>
                    <option value="50">5</option>
                </select>
            </td>
            <td>
                <img src="img/���.jpg" alt="�o�O���" width="auto" height="80">
            </td>
        </tr>
    
        <tr>
            <td><input type="checkbox" id="myCheck2" onclick="myFunction2()"></td><td>����</td>
            <td>$15</td>
            <td>
                <select id="drink2" onchange="drinkfunction2(this);">    <!--���s�Oonclick  ���Oonchange-->
                    <option selected="selected" value="0">�аݻݭn�X�M</option>
                    <option value="15">1</option>
                    <option value="30">2</option>
                    <option value="45">3</option>
                    <option value="60">4</option>
                    <option value="75">5</option>
                </select>
            </td>
            <td>
                <img src="img/����.jpg" alt="�o�O����" width="auto" height="80">
            </td>
        </tr>

        <tr>
            <td><input type="checkbox" id="myCheck3" onclick="myFunction3()"></td><td>����</td>
            <td>$20</td>
            <td>
                <select id="drink3" onchange="drinkfunction3(this);">    <!--���s�Oonclick  ���Oonchange-->
                    <option selected="selected" value="0">�аݻݭn�X�M</option>
                    <option value="20">1</option>
                    <option value="40">2</option>
                    <option value="60">3</option>
                    <option value="80">4</option>
                    <option value="100">5</option>
                </select>
            </td>
            <td>
                <img src="img/����.jpg" alt="�o�O����" width="auto" height="80">
            </td>
        </tr>

        <tr>
            <td><input type="checkbox" id="myCheck4" onclick="myFunction4()"></td><td>�A����</td>
            <td>$30</td>
            <td>
                <select id="drink4" onchange="drinkfunction4(this);">    <!--���s�Oonclick  ���Oonchange-->
                    <option selected="selected" value="0">�аݻݭn�X�M</option>
                    <option value="30">1</option>
                    <option value="60">2</option>
                    <option value="90">3</option>
                    <option value="120">4</option>
                    <option value="150">5</option>
                </select>
            </td>
            <td>
                <img src="img/�A����.jpg" alt="�o�O�A����" width="auto" height="80">
            </td>
        </tr>
    </tbody>
</table>
<br>

    
    
<form action="vbtest_back.aspx" method="GET">
    <input name="UserName" id="UserNameId" placeholder="�W�r">
    <input name="Phone" id="PhoneId" placeholder="�q��">
    <input name="Add" value="1" style="display:none">
    <input name="Content" id="contentid" vlaue="" style="display:none">
    <button type="submit" id="submitid" style="display:none">�e�X</button>
    <button  type="button" class="button" onclick="buttonFunction()" style="background-color: rgb(245, 236, 112);width: 100px;height:45px;color: rgb(92, 22, 10);font-family:Microsoft JhengHei;">�e�X</button>
    <input name="money" id="moneyid" value="" style="display:none">
</form>


<script>
    var money=0;
    var money1=0;
    var money2=0;
    var money3=0;
    var money4=0;
    var c1=0;
    var c2=0;
    var c3=0;
    var c4=0;
    var text;    

    function myFunction1() {
        var checkBox = document.getElementById("myCheck1");
        if (checkBox.checked == true){
            c1=c1+1;
            drink1.selectedIndex = 1;
            money1=parseInt(10);

        }
        else{
            drink1.selectedIndex = "�аݻݭn�X�M";
            document.getElementById("myCheck1").checked = false;
            money1=0;
            
            
        }
    }

    function drinkfunction1(data){

        document.getElementById("myCheck1").checked = true;
        c1=c1+1;

        if(c1!= 0){
           
            money1=parseInt(data.value);
            
        }
        if(drink1.options[0].selected == true){
            document.getElementById("myCheck1").checked = false;
        }
        
    }
            

    function myFunction2() {
        var checkBox = document.getElementById("myCheck2");
        if (checkBox.checked == true){
            c2=c2+1;
            drink2.selectedIndex = 1;
            money2=parseInt(15);
        }
        else{
            drink2.selectedIndex = "�аݻݭn�X�M";
            document.getElementById("myCheck2").checked = false;
            money2=0;
        }
    }

    function drinkfunction2(data){
        document.getElementById("myCheck2").checked = true;
        c2=c2+1;

        if(c2!= 0){
            money2=parseInt(data.value);
        }
        if(drink2.options[0].selected == true){
            document.getElementById("myCheck2").checked = false;
        }
    }
            

    function myFunction3() {
        var checkBox = document.getElementById("myCheck3");
        if (checkBox.checked == true){
            c3=c3+1;
            drink3.selectedIndex = 1;
            money3=parseInt(20)
        }
        else{
            drink3.selectedIndex = "�аݻݭn�X�M";
            document.getElementById("myCheck3").checked = false;
            money3=0;
        }
    }

    function drinkfunction3(data){
        document.getElementById("myCheck3").checked = true;
        c3=c3+1;

        if(c3!= 0){
            money3=parseInt(data.value);
            
            }
        if(drink3.options[0].selected == true){
            document.getElementById("myCheck3").checked = false;
        }
    }
            
 
    function myFunction4() {
        var checkBox = document.getElementById("myCheck4");
        if (checkBox.checked == true){
            c4=c4+1
            drink4.selectedIndex = 1;
            money4=parseInt(30);
        } 
        else{
            drink4.selectedIndex = "�аݻݭn�X�M";
            document.getElementById("myCheck4").checked = false;
            money4=0;
        }
    }

    function drinkfunction4(data){
        document.getElementById("myCheck4").checked = true;
        c4=c4+1;

        if(c4!= 0){
            money4=parseInt(data.value);
        }
        if(drink4.options[0].selected == true){
            document.getElementById("myCheck4").checked = false;
        }
    }
    

    
    
    function buttonFunction(){


        var co1 = "";
        var co2 = "";
        var co3 = "";
        var co4 = "";



       if(money1 != 0){
            if(co1=="" && co2=="" && co3=="" && co4==""){    //  || or /// &&  and
                    co1 = co1+ "���@" + drink1.selectedIndex ;
            }
            else{
                co1 = co1+ ",���@" + drink1.selectedIndex ;
            }
        }

        if(money2 != 0){
            if(co1=="" && co2=="" && co3=="" && co4==""){    //  || or /// &&  and
                    co2 = co2+ "����@" + drink2.selectedIndex ;
            }
            else{
                co2 = co2 + ",����@" + drink2.selectedIndex ;
            }
        }

        if(money3 != 0){
            if(co1=="" && co2=="" && co3=="" && co4==""){    //  || or /// &&  and
                    co3 = co3+ "����@" + drink3.selectedIndex ;
            }
            else{
                co3 = co3 + ",����@" + drink3.selectedIndex ;
            }
        }

        if(money4 != 0){
            if(co1=="" && co2=="" && co3=="" && co4==""){    //  || or /// &&  and
                    co4 = co4+ "�A����@"+ drink4.selectedIndex ;
            }
            else{
                co4 = co4 + ",�A����@" + drink4.selectedIndex ;
            }
        }


        text=co1 + co2 + co3 + co4;

        
        document.getElementById("contentid").value=text;
     
        money = money1 + money2 + money3 + money4;

        document.getElementById("moneyid").value=money;


        var parameters = "Add=1&UserName=" + document.getElementById("UserNameId").value + "&Phone=" + document.getElementById("PhoneId").value + "&Content=" + document.getElementById("contentid").value + "&money=" + document.getElementById("moneyid").value;
 

        

        var call_backend_mode = 2;
        

        if(call_backend_mode == 1){

            document.getElementById("submitid").click();

            if("addok" == "<%= request("status") %>")
            {
                
                alert('�w�����q��A�`�B:' + "<%= request("money") %>");
            //'�w�����q��A�`�B:'
            }
           
            if("error" == "<%= request("status") %>")
            {
                alert('���Ʃ|���I�粒��');
            }

        }
        else if (call_backend_mode ==2 ){

            $.ajax({
                url: "vbtest_back.aspx", timeout: 1000, type: "post",
                data: parameters,
                success: function (e) { 
                    if(e == "ok"){
                        alert('�w�����q��, �`�B:' + document.getElementById("moneyid").value);
                    }
                    else if(e == "error"){
                        alert('���Ʃ|���I�粒��');
                    }

                },
                error: function (xhr, status, error) {
                    alert("vbtest_back error"); 
                }

            });

        }
        co1="";
        co2="";
        co3="";
        co4="";
        text="";    
 

    }
  

</script>




















