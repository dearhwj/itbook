# Mybatis Plus(MyBatis增强工具包)
### 简介
[开源项目主页](http://www.oschina.net/p/mybatis-plus)
MyBatis 增强工具包，简化 CRUD 操作。启动加载 XML 配置时注入***单表*** SQL 操作 ，省却了写那些基本SQL的工作量。自定义的SQL还是写相应的Mapper XML和Java类没有变化。


### 功能说明
mybatis提供了以下缺省的CRUD功能：

1. int insert( T entity )：插入一条记录
2. int insertSelective( T entity )：插入一条记录（选择字段， null 字段不插入）
3. int insertBatch( List<T> entityList )： 插入（批量）
4. int deleteById( I id ):根据 ID 删除
5. int deleteByMap( @Param("cm" ) Map<String, Object> columnMap)： 根据 columnMap 条件，删除记录
6. int deleteSelective( @Param("ew" ) T entity):根据 entity 条件，删除记录
7. int deleteBatchIds( List<I> idList ):删除（根据ID 批量删除）
8. int updateById( @Param("et" ) T entity)：根据 ID 修改
9. int updateSelectiveById( @Param("et" ) T entity): 根据 ID 选择修改,选择字段 null 字段不更新
10. int update( @Param("et" ) T entity, @Param("ew") T whereEntity): 根据 whereEntity 条件，更新记录
11. int updateSelective( @Param("et" ) T entity, @Param("ew") T whereEntity)：根据 whereEntity 条件，选择更新记录，选择字段 null 字段不更新
12. int updateBatchById( List<T> entityList ):根据ID 批量更新
13. T selectById( I id )：根据 ID 查询
14. List<T> selectBatchIds( List<I> idList )：查询（根据ID 批量查询）
15. List<T> selectByMap( @Param("cm" ) Map<String, Object> columnMap):查询（根据 columnMap 条件）
16. T selectOne( @Param("ew" ) T entity): 根据 entity 条件，查询一条记录
17. int selectCount( @Param("ew" ) T entity)：根据 entity 条件，查询总记录数
18. List<T> selectList( @Param("ew" ) EntityWrapper<T> entityWrapper):根据 entity 条件，查询全部记录
19. List<T> selectPage( RowBounds rowBounds, @Param("ew" ) EntityWrapper<T> entityWrapper)：根据 entity 条件，查询全部记录（并翻页）


### 示例
用从原来的spring+mybaits的集成方式变成spring+mybaits plus+mybaits  还是很简单的，只需要几个步骤。

1.  将原来的spring的sqlSessionFactory,改成mybatisplus提供的sqlSessionFactory，代码如下

	``` 

    原来的
	    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    	    <property name="dataSource" ref="dataSource" />
        	<property name="mapperLocations" value="classpath:mapper/*Mapper.xml" />
	        <property name="typeAliasesPackage" value="com.aliyun.taiji.dal.dao.impl" />
	        <property name="configuration">
	           	 <bean class="org.apache.ibatis.session.Configuration">
    	            <property name="mapUnderscoreToCamelCase" value="true"/>
            	</bean>
        	</property>
	    </bean> 	
	    变动以后的
    	 <bean id="sqlSessionFactory" 			class="com.baomidou.mybatisplus.spring.MybatisSqlSessionFactoryBean">
	        <property name="dataSource" ref="dataSource" />
    	    <property name="mapperLocations" value="classpath:mapper/*Mapper.xml" />
        <property name="typeAliasesPackage" value="com.aliyun.taiji.project.dal.model" />
        <property name="configuration">
            <bean class="org.apache.ibatis.session.Configuration">
                <property name="mapUnderscoreToCamelCase" value="true"/>
            </bean>
        </property>
	    </bean>
	    
	```
2. 对单表对应的pojo加上mybatis plus所需的annotation。 mybatis plus提供了3种Annotation。
	3. @TableName用于声明pojo对应的单表名 
	4. @TableId用于声明pojo对应的单表的PK字段。PK字段目前支持4种生成策略。
		1. AUTO:数据库ID自增
		2. INPUT:用户输入ID
		3. ID_WORKER: 全局唯一ID。这个是基于Twitter-Snowflake的Java实现，想了解算法细节的可以参考[Twitter-Snowflake，64位自增ID算法详解](http://www.lanindex.com/twitter-snowflake%EF%BC%8C64%E4%BD%8D%E8%87%AA%E5%A2%9Eid%E7%AE%97%E6%B3%95%E8%AF%A6%E8%A7%A3/)
		4. UUID
	5. @TableField用于申明pojo熟悉和表字段的对应关系。


		
			
		@TableName("project_member")
		public class ProjectMember extends BaseModel {

    	@TableId(value = "id",type = IdType.AUTO)
    	private Integer id;

	    /**
    	 * 项目ID
	     */
	    @TableField("project_id")
    	private Integer projectId;

	    /**
    	 * 工号
	     */
    	@TableField("work_number")
	    private String workNumber;

	    /**
    	 * 登录名
	     */
    	@TableField("login_name")
	    private String loginName;


		}
	
		
	 
3. 定义相关的mybatis mapper。mybatis plus提供了一个BaseMapper包含了缺省的CRUD功能。所以，我们自己的mapper只需要继承该接口后，无需编写 mapper.xml 文件，即可获得CRUD功能。
	![image](http://blogimages.oss-cn-hangzhou.aliyuncs.com/mybatis_plus_base_mapper_methods.png)
	
	
	
	
	public interface ProjectMemberMapper extends BaseMapper<ProjectMember,Integer>{


	}
	
	
4. 定义相关的业务类。虽然mybatis plus 提供了缺省基于通用CRUD的业务操作的接口(IService)和实现类(CommonServiceImpl、SuperServiceImpl)，但这些业务类的定义都是面向CRUD，而不是面向业务操作的封装，所以我更喜欢自己去封装业务类,这样语义会更清楚一些。mybatis plus 提供了比较丰富的单表操作的CRUD实现，实现封装成本也不大。


	
	
	public interface ProjectMemberBo {


    /**
     * 批量插入ProjectMember
     * @param members
     * @return
     */
    boolean batchInsertProjectMembers(List<ProjectMember> members);


    /**
     * 根据工号查询ProjectMember
     * @param workNumber
     * @return
     */
    List<ProjectMember> queryProjectMemberListByWorkNumber(String workNumber);


    /**
     * 根据ProjectID查询ProjectMember
     * @param projectId
     * @return
     */
    List<ProjectMember> queryProjectMemberListByProjectId(Integer projectId);


    /**
     * 删除项目成员信息
     * @param projectId
     * @param empId
     * @return
     */
    boolean deleteProjectMember(Integer projectId,String empId);
	}
	
	
	
	
	实现类注入了mapper以后，可以基于缺省的CRUD操作实现业务操作。
	
	
	
	
	public class ProjectMemberBoImpl implements ProjectMemberBo {


    	@Autowired
	    private ProjectMemberMapper projectMemberMapper;

    	@Override
	    public boolean batchInsertProjectMembers(List<ProjectMember> members) {
        if(members==null || members.size()==0){
            throw  new IllegalArgumentException("param[members] cannot be null or empty");
        }

        for (ProjectMember item:members){
            if(item==null){
                throw  new IllegalArgumentException("param[members.item] cannot be null or empty");
            }

            if(item.getDeleted()==null|| item.getDeleted()==true){
                throw  new IllegalArgumentException("param[members.item.deleted] cannot be null or false");
            }

            item.setGmtCreated(new Date());
            item.setGmtModified(new Date());
            if(item.getProjectId()==null){

                throw new IllegalArgumentException("param[members.item.projectId] cannot be null");
            }
            if(StringUtils.isBlank(item.getLoginName())){
                throw new IllegalArgumentException("param[members.item.loginName] cannot be empty");
            }

            if(StringUtils.isBlank(item.getWorkNumber())){
                throw new IllegalArgumentException("param[members.item.worknumber] cannot be empty");
            }
        }
        return projectMemberMapper.insertBatch(members)==members.size();

    }
	
	    @Override
    	public List<ProjectMember> queryProjectMemberListByWorkNumber(String workNumber) {
        	if(workNumber==null){
            	throw  new IllegalArgumentException("Param[workNumber] cannot be null");
	        }


    	    ProjectMember item=new ProjectMember();
        	item.setWorkNumber(workNumber);
	        item.setDeleted(false);
    	    EntityWrapper<ProjectMember> condition=new EntityWrapper<ProjectMember>(item);
        	return projectMemberMapper.selectList(condition);
	    	}

	    	@Override
		    public List<ProjectMember> queryProjectMemberListByProjectId(Integer projectId) {


        		if(projectId==null){
	            throw  new IllegalArgumentException("Param[projectId] cannot be null");
    	    }

        	ProjectMember item=new ProjectMember();
	        item.setProjectId(projectId);
    	    item.setDeleted(false);
        	EntityWrapper<ProjectMember> condition=new EntityWrapper<ProjectMember>(item);

	        return projectMemberMapper.selectList(condition);
    		}

	    @Override
    	public boolean deleteProjectMember(Integer projectId, String empId) {

        	if(projectId==null){
            	throw new IllegalArgumentException("param[projectId] cannot be null");
	        }
    	    if(empId ==null){
        	    throw new IllegalArgumentException("param[workNumber] cannot be null");
	        }
    	    ProjectMember entity=new ProjectMember();
        	entity.setDeleted(true);
	        ProjectMember where=new ProjectMember();
    	    where.setProjectId(projectId);
        	where.setDeleted(false);
	        where.setWorkNumber(empId);
    	    return projectMemberMapper.updateSelective(entity, where)==1;
    	}
	}
	
	


### mybatis plus的实现原理
用mybatis plus提供的MybatisSqlSessionFactoryBean接管了mybits的spring初始化工作以后，当parse每一个mapper资源的时候，mybatis plus会根据pojo的annotion的信息生成相应的sql语句，并转换成mybatis的内部对象，加入到mybatis中。如果自动生成的sql的ID跟自定义的映射文件的有冲突，会以自定义的映射文件中优先。