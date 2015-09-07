<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Example for timesheet.js</title>
        <meta name="description" content="Example for timesheet.js">
        <meta name="author" content="Author">

        <!-- Mobile Specific Meta -->
        <sj:head jqueryui="false"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="scripts/css/generals/timesheet.min.css">        
    </head>
    <body>
        <div id="timeview" style="width:100%; height:100%"></div>        
        <script src="scripts/js/generals/timesheet.min.js"></script>
        <script>
            new Timesheet('timeview', 'Janv', 'Dec', [
                ['2002', '09/2002', 'A freaking awesome time', 'lorem'],
                ['06/2002', '09/2003', 'Some great memories', 'ipsum'],
                ['2003', 'Had very bad luck'],
                ['10/2003', '2006', 'At least had fun', 'dolor'],
                ['02/2005', '05/2006', 'Enjoyed those times as well', 'ipsum'],
                ['07/2005', '09/2005', 'Bad luck again', 'default'],
                ['10/2005', '2008', 'For a long time nothing happened', 'dolor'],
                ['01/2008', '05/2009', 'LOST Season #4', 'lorem'],
                ['01/2009', '05/2009', 'LOST Season #4', 'lorem'],
                ['02/2010', '05/2010', 'LOST Season #5', 'lorem'],
                ['09/2008', '06/2010', 'FRINGE #1 & #2', 'ipsum']
            ]);
            $('#timeview').show();
        </script>
    </body>
</html>