/************************************************************************/
/*                         C API连接MySQL                               */
/************************************************************************/

#include<stdio.h>
#include<windows.h>																//MySQL5.5的mysql.h头文件需要，否则报错
#include"mysql.h"																//MySQL头文件，在MySQL目录/include中
int main()
{
	MYSQL *mysql = new MYSQL;													//指向MySQL结构体
	MYSQL_RES *result;															//查询到的结果集
	MYSQL_FIELD *field;															//数据表字段指针
	MYSQL_ROW row;																//数据行变量，后面用来保存列数组


	if (mysql_init(mysql) == NULL)												//初始化MYSQL结构体
	{
		fprintf(stderr,"Cannot Initialize MySQL");
		return 1;
	}



	if (!mysql_real_connect(mysql,LOCAL_HOST,"root","m4a1421","test",0,NULL,0))	//连接MySQL服务器，参数含义：
																				//MySQL结构体引用，主机名或IP地址，
																				//用户名，密码，库名，端口号（0默认），
																				//套接字文件的名字（NULL默认），客户端标识（0默认）
	{
		fprintf(stderr,"%d: %s \n",mysql_errno(mysql),mysql_error(mysql));		//mysql_errno()获取错误号，
																				//mysql_error()获取错误信息
		return 1;
	}

	if (mysql_query(mysql,"SELECT * FROM test"))								//mysql_query()执行sql语句
	{
		fprintf(stderr,"%d: %s\n",
			mysql_error(mysql),mysql_error(mysql));
	}
	else
	{
		result = mysql_store_result(mysql);										//mysql_store_result()获取结果集,存入result

		while(field = mysql_fetch_field(result))								//mysql_fetch_field()循环获取结果集表字段，field->name
		{
			printf("%s\t",field->name);
		}
		printf("\n");

		while (row = mysql_fetch_row(result))									//mysql_fetch_row()循环获取结果集行数据数组
		{
			printf("%s\t%s \n",row[0],row[1]);									//row[0],row[1]... 行数组各字段数据
		}
		mysql_free_result(result);												//mysql_free_result()释放result所指内存
	}
	mysql_close(mysql);															//mysql_close()断开MySQL连接
	return 0;
}