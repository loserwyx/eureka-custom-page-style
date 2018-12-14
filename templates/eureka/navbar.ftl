<#--<h1>系统状态  System Status</h1>-->
<div class="divStyle">
    <h5 class="form-section fontColor">系统状态 System Status</h5>
    <div class="row">
        <div class="col-md-12">
            <table id='instances' class="table table-condensed table-striped table-hover">
                <thead>
                <tr>
                    <th>环境</th>
                    <th>数据中心</th>
                    <th>当前时间</th>
                    <th>更新时间</th>
                    <th>租约到期</th>
                    <th>更新阈值</th>
                    <th>更新(最后一分钟)</th>
                </tr>
                </thead>
      <#if amazonInfo??>
        <tr>
            <td>EUREKA 服务器</td>
            <td>AMI: ${amiId!}</td>
        </tr>
        <tr>
            <td>区域</td>
            <td>${availabilityZone!}</td>
        </tr>
        <tr>
            <td>实例id</td>
            <td>${instanceId!}</td>
        </tr>
      </#if>
                <tr>
                    <td>${environment!}</td>
                    <td>${datacenter!}</td>
                    <td>${currentTime}</td>
                    <td>${upTime}</td>
                    <td>${registry.leaseExpirationEnabled?c}</td>
                    <td>${registry.numOfRenewsPerMinThreshold}</td>
                    <td>${registry.numOfRenewsInLastMin}</td>
                </tr>
            <#--<tr>-->
            <#--<td>环境</td>-->
            <#--<td>${environment!}</td>-->
            <#--</tr>-->
            <#--<tr>-->
            <#--<td>数据中心</td>-->
            <#--<td>${datacenter!}</td>-->
            <#--</tr>-->
            </table>
        </div>
    <#--<div class="col-md-6">-->
    <#--<table id='instances' class="table table-condensed table-striped table-hover">-->
    <#--<tr>-->
    <#--<td>当前时间</td>-->
    <#--<td>${currentTime}</td>-->
    <#--</tr>-->
    <#--<tr>-->
    <#--<td>启动时长</td>-->
    <#--<td>${upTime}</td>-->
    <#--</tr>-->
    <#--<tr>-->
    <#--<td>租约到期后启用</td>-->
    <#--<td>${registry.leaseExpirationEnabled?c}</td>-->
    <#--</tr>-->
    <#--<tr>-->
    <#--<td>更新阈值</td>-->
    <#--<td>${registry.numOfRenewsPerMinThreshold}</td>-->
    <#--</tr>-->
    <#--<tr>-->
    <#--<td>更新 (最后一分钟)</td>-->
    <#--<td>${registry.numOfRenewsInLastMin}</td>-->
    <#--</tr>-->
    <#--</table>-->
    <#--</div>-->
    </div>

<#if isBelowRenewThresold>
    <#if !registry.selfPreservationModeEnabled>
        <h4 id="uptime"><font size="+1" color="red"><b>续约低于阀值. 自我保护模式关闭. 对于网络/其他问题，这可能无法保护实例过期</b></font></h4>
    <#else>
        <h4 id="uptime"><font size="+1" color="red"><b>注意! EUREKA 可能对未启动的实例声称为启动状态，续约低于阀值，为了安全，实例不会过期</b></font>
        </h4>
    </#if>
<#elseif !registry.selfPreservationModeEnabled>
    <h4 id="uptime"><font size="+1" color="red"><b>自我保护模式关闭.对于网络/其他问题，这可能无法保护实例过期</b></font></h4>
</#if>
</div>
    <div class="divStyle blockMarign">
        <div class="row">
            <div class="col-md-12">
                <h5 class="form-section fontColor">DS 副本</h5>

                <ul class="list-group">
  <#list replicas as replica>
      <li class="list-group-item"><a href="${replica.value}">${replica.key}</a></li>
  </#list>
                </ul>
            </div>
        </div>
    </div>

