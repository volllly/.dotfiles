shell
{
	var
	{
		isw11=sys.is11
	}
	
	set
	{
		theme
		{
			name="modern"
			background
			{
				//opacity=85
				//effect=1
			}
			image.align = 1
		}
		
		exclude.where = !process.is_explorer
		showdelay=200
	}

	images import 'imports/images.nss'

	static
	{	
		import 'imports/static.nss'
		item(where=this.title.length > 25 menu=title.more_options)
	}

	dynamic
	{
		import 'imports/terminal.nss'
		import 'imports/file-manage.nss'
		import 'imports/develop.nss'
		
		menu(type="taskbar" vis=key.shift() pos=0 title=app.name image=\uE249)
		{
			item(title="config" image=\uE10A cmd='"@app.cfg"')
			item(title="manager" image=\uE0F3 admin cmd='"@app.exe"')
			item(title="directory" image=\uE0E8 cmd='"@app.dir"')
			item(title="version\t"+@app.ver vis=label col=1)
			item(title="docs" image=\uE1C4 cmd='https://nilesoft.org/docs')
			item(title="donate" image=\uE1A7 cmd='https://nilesoft.org/donate')
		}
		
		import if(isw11, 'imports/taskbar.nss')
	}
}