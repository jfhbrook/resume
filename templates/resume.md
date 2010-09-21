# <<author>>
<<streetaddress>> <<citystatezip>> -- <<phone>> -- <<email>> -- <<webpage>>

<= if objective =>
## Objective:
<<objective[0]['text']>>
<= endif =>

<= if skills =>
## Skills and Qualifications:

<= for skill in skills =>
* <<skill>>
<= endfor =>
<= endif=>

<= if schools =>
## Education:

<= for school in schools =>
### << school['degree'] >> -- << school['dates'] >>
<< school['place'] >>
<= if school['minor'] =>
*Minor in <<school['minor']>>*
<= endif =>
<= if school['chrs'] =>
*Completed <<school['chrs']>> Credit Hours*  
<= endif =>
<= if school['gpa'] =>
*<< school['gpa'] >> GPA*
<= endif =>
<= endfor =>
<= endif =>

<= if projects =>
## Projects:
    <= for project in projects =>
### << project['title'] >> -- << project['dates'] >>
        <= if project['descr'] =>
            <= for line in project['descr'] =>
* <<line>>
            <= endfor =>
        <= endif =>
    <= endfor =>
<= endif =>

<= if service =>
## Service:
    <= for serv in service =>
### << serv['groupname'] >> -- << serv['dates'] >>
        <= if serv['duties'] =>
            <= for line in serv['duties'] =>
* <<line>>
            <= endfor =>
        <= endif =>
    <= endfor =>
<= endif =>

<= if awards =>
## Awards & Grants:
    <= for project in awards =>
### << project['title'] >> -- << project['dates'] >>
        <= if project['descr'] =>
            <= for line in project['descr'] =>
* <<line>>
            <= endfor =>
        <= endif =>
    <= endfor =>
<= endif =>

<= if jobs =>
## Employment History:

<= for job in jobs =>
### <<job['jobtitle']>> -- <<job['dates']>>
<<job['employername']>>
Job duties include:
<= for duty in job['duties'] =>
* <<duty>>
<= endfor =>
<= endfor =>
<= endif =>
