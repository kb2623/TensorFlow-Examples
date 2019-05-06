kernelName:=rosispy

install: Pipfile
	pipenv install
	pipenv run jupyter labextension install @jupyter-widgets/jupyterlab-manager
	pipenv run jupyter labextension install jupyter-matplotlib
	pipenv run jt -t onedork -lineh 110 -nfs 10 -fs 10 -tfs 10 -cellw 80%

kernel: install
	pipenv run python -m ipykernel install --user --name=$(kernelName)

rKernel:
	jupyter kernelspec remove -f $(kernelName)

run:
	pipenv run jupyter lab

lab:
	pipenv run jupyter lab

notebook:
	pipenv run jupyter notebook

clean: Pipfile.lock
	pipenv --rm
	rm Pipfile.lock

all: install kernel run 
